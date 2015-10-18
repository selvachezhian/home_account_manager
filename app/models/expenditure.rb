class Expenditure < ActiveRecord::Base

  belongs_to :default_expenditure
  belongs_to :user

  validates :name, :date, presence: true
  validates :amount, presence: true, format: { with: /\A(?:[0-9]+)(?:[0-9]+\.[0-9]+)\z/ }

  # Expenditure for specified date range
  # @param from [Date]
  # @param to [Date]
  # @return [Expenditure]
  scope :between, ->(from, to) { where('date >= ? AND date <= ?', from, to) }

  # Expenditure for current month and year
  # @return [Expenditure]
  def self.for_current_month
    today = Time.zone.now
    between(today.beginning_of_month, today.end_of_month)
  end

  # Expenditures for selected month and year
  # @param month [Integer] the month needs to be selected
  # @param year [Integer] which year the month needs to be selected
  # @return [Expenditure]
  def self.for_selected_month(month, year)
    selected_date = Date.new(year.to_i, month.to_i)
    between(selected_date.beginning_of_month, selected_date.end_of_month)
  end

end
