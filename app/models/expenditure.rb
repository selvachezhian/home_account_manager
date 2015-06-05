class Expenditure < ActiveRecord::Base

  belongs_to :user

  validates :name, :date, presence: true
  validates :amount, presence: true, format: { with: /\A(?:[0-9]+)(?:[0-9]+\.[0-9]+)\z/ }

  scope :between, ->(from, to) { where('date >= ? AND date <= ?', from, to) }

  def self.for_current_month
    today = Time.zone.now
    between(today.beginning_of_month, today.end_of_month)
  end

end
