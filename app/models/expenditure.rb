class Expenditure < ActiveRecord::Base

  belongs_to :user

  validates :name, :date, presence: true
  validates :amount, presence: true, format: { with: /\A(?:[0-9]+)(?:[0-9]+\.[0-9]+)\z/ }

  scope :between, ->(from, to) { where('date >= ? AND date <= ?', from, to) }

  def self.for_current_month
    today = Time.zone.now
    between(today.beginning_of_month, today.end_of_month)
  end

  def self.for_selected_month(month, year)
    selected_date = Date.new(year.to_i, month.to_i)
    between(selected_date.beginning_of_month, selected_date.end_of_month)
  end

end
