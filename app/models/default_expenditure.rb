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
