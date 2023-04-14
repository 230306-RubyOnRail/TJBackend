require_relative '../../lib/json_web_token'

class UsersController < ApplicationController
    include Authenticatable

    def create
     data = JSON.parse(request.body.read)
     @user = User.where(username: data['username'])
     if @user.empty? && @current_user['manager'] == true
       User.create(username: data['username'], password_digest: data['password'], manager: data['manager'])
       render json: {message: 'created'}, status: :created
     else
      render json: {message: 'did not make the new user'}, status: :bad_request
     end
    end
end
