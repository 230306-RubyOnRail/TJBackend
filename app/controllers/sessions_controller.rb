require_relative '../../lib/json_web_token'

class SessionsController < ApplicationController
  def create
    credentials = JSON.parse(request.body.read)
    user = {user_id: 'j', email: 'j.doe@gmail.com', password: 'password'}
    render json: {token: JsonWebToken.encode(user_id: user[:user_id])}, status: :created
  end
end
