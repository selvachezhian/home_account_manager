# == Schema Information
#
# Table name: default_expenditures
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_default_expenditures_on_user_id  (user_id)
#

# :nodoc:
class DefaultExpenditure < ActiveRecord::Base
  has_many :expenditures
  belongs_to :user

  scope :by_users, ->(user_ids) { where('user_id in (?)', user_ids) }

  def self.for_current_user(user)
    by_users([0, user.id])
  end

  def editable?(user)
    user_id == user.id
  end
end
