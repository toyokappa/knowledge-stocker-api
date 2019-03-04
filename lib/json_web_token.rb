require "jwt"

class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.credentials.config[:secret_key_base])
    end

    def decode(token)
      payload = JWT.decode(token, Rails.application.credentials.config[:secret_key_base])[0]
      HashWithIndifferentAccess.new(payload)
    rescue
      nil
    end
  end
end
