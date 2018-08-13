class JsonWebToken
  class << self

    def encode(payload, exp = 12.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode payload, ENV['JWT_SECRET'], 'HS256'
    end

    def decode(token)
      JWT.decode token, ENV['JWT_SECRET'], true, { algorithm: 'HS256' } rescue 'Invalid Access Token.'
    end

  end
end
