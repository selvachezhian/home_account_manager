# == Schema Information
#
# Table name: secrets
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  secret_values_count :integer          default(0)
#
# Indexes
#
#  index_secrets_on_user_id  (user_id)
#

# :nodoc:
class Secret < ActiveRecord::Base
  has_many :secret_values, dependent: :destroy

  belongs_to :user

  validates :name, presence: :true
end
