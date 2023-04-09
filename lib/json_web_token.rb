# frozen_string_literal: true
class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, '')

  end

  def self.decode(token)
    puts "In decode"
    JWT.decode(token, '', false, {algorithm: 'HS256'})[0]
  rescue JWT::ExpiredSignature, JWT::ValidationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::ValidationError => e
    raise ExceptionHandler::DecodeError, e.message
  end
end
