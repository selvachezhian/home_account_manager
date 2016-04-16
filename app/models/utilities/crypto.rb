# :nodoc:
class Utilities
  # :nodoc:
  class Crypto
    def initialize
      @crypt = ActiveSupport::MessageEncryptor.new(CRYPTO_SECRET_KEY)
    end

    def encrypt(str)
      @crypt.encrypt_and_sign(str.to_s)
    end

    def decrypt(enc_str)
      @crypt.decrypt_and_verify(enc_str)
    end
  end
end
