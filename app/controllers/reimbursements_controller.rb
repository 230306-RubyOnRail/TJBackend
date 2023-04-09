require_relative '../../lib/json_web_token'
class ReimbursementsController < ApplicationController
  include Authenticatable
  def index
    render json: {message: 'index'}
  end

  def create
    #data = JSON.parse(request.body.read)
    #@user = User.includes(:data['username']).where(user_id: current_user.id)
    #puts "#{user}"
    #if @current_user['manager']
      #  User.create(username: '')
    #  render json: {message: 'create'}, status: :created
    #end
    render json: {message: 'create'}
  end

  def show
    render json: {message: 'show'}
  end

  def show_all
    render json: {message: 'show_all'}
  end

  def update
    render json: {message: 'update'}
  end

  def delete
    render json: {message: 'delete'}
  end
end
