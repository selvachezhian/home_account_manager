# :nodoc:
class Secret < ActiveRecord::Base
  has_many :secret_values, dependent: :destroy

  belongs_to :user

  validates :name, presence: :true
end
