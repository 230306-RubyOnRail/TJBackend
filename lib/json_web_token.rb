# frozen_string_literal: true
class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_token_secret)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.jwt_token_secret)[0]
  rescue JWT::ExpiredSignature, JWT::ValidationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::ValidationError => e
    raise ExceptionHandler::DecodeError, e.message
  end
end
