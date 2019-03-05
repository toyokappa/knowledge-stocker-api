require "jwt"

class JsonWebToken
  SECRET_KEY = Rails.application.credentials.config[:secret_key_base]

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      payload = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new(payload)
    rescue
      nil
    end
  end
end
