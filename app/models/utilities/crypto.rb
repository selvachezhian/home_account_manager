class Utilities::Crypto

  def initialize
    @crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  end

  def encrypt(str)
    @crypt.encrypt_and_sign(str.to_s)
  end

  def decrypt(enc_str)
    @crypt.decrypt_and_verify(enc_str)
  end

end