require_relative '../../lib/json_web_token'
class SessionsController < ApplicationController
  def create
    credentials = JSON.parse(request.body.read)
    user = User.where(username: credentials['username']).first
    if user['password_digest'] === (credentials['password'])
      render json: { token: JsonWebToken.encode(user_id: user.id), user_id: user.id}, status: :created
    else
      head :unauthorized
    end
  end

  
end