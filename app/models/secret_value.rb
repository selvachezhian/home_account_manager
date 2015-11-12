class SecretValue < ActiveRecord::Base

  belongs_to :secret

  %w(key value).each do |attr|
    crypto = Utilities::Crypto.new
    define_method(attr.to_sym) { crypto.decrypt(super()) }
    define_method("#{attr}=".to_sym) { |val| super(crypto.encrypt(val)) }
  end

end
