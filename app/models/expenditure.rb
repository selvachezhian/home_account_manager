# == Schema Information
#
# Table name: expenditures
#
#  id                     :integer          not null, primary key
#  name                   :string
#  amount                 :float
#  description            :text
#  date                   :datetime
#  user_id                :integer
#  created_by_id          :integer
#  updated_by_id          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  default_expenditure_id :integer
#
# Indexes
#
#  index_expenditures_on_amount                  (amount)
#  index_expenditures_on_default_expenditure_id  (default_expenditure_id)
#  index_expenditures_on_user_id                 (user_id)
#

# :nodoc:
class Expenditure < ActiveRecord::Base
  def initialize(attributes = nil, options = {})
    super(attributes, options)
    self.date ||= Date.today
  end

  belongs_to :default_expenditure
  belongs_to :user

  validates :name, :date, presence: true
  validates :default_expenditure_id,
            presence: { message: "Type can't be blank" }
  validates :amount,
            presence: true,
            format: { with: /\A(?:[0-9])+(?:\.[0-9]{1,2}){0,1}\z/ }

  # Expenditure for specified date range
  # @param from [Date]
  # @param to [Date]
  # @return [Expenditure]
  scope :between, ->(from, to) { where(date: from..to) }

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
    selected_date = Date.new(year.to_i, month.to_i).to_datetime.in_time_zone
    between(selected_date.beginning_of_month, selected_date.end_of_month)
  end
end
