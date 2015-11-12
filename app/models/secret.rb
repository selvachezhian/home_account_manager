class Secret < ActiveRecord::Base

  has_many :secret_values

  belongs_to :user

end
