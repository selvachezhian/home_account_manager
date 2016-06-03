# == Schema Information
#
# Table name: secret_values
#
#  id         :integer          not null, primary key
#  secret_id  :integer
#  key        :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_secret_values_on_secret_id  (secret_id)
#

# :nodoc:
class SecretValue < ActiveRecord::Base
  belongs_to :secret, counter_cache: true

  %w(key value).each do |attr|
    crypto = Utilities::Crypto.new
    define_method(attr.to_sym) { crypto.decrypt(super()) }
    define_method("#{attr}=".to_sym) { |val| super(crypto.encrypt(val)) }
  end
end
