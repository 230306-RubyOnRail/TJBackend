require_relative '../../lib/json_web_token'
class ReimbursementsController < ApplicationController
  include Authenticatable
  def index
    render json: {message: 'index'}
  end

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

  def show
    if @current_user['manager'] == true
      @user = Reimbursement.select('id', 'title','description', 'approved')
      render json: @user.as_json, status: :ok
    else
      @user = Reimbursement.select('id', 'title','description', 'approved').where(user_id: @current_user['id'])
      if @user.empty?
        render json: {message: 'none to display'}, status: :ok
      else
        render json: @user.as_json, status: :ok
      end
    end
    render json: {message: 'unable to process request'}, status: :bad_request
  end

  def update
    render json: {message: 'update'}
  end

  def delete
    data = JSON.parse(request.body.read)
    if @current_user['manager'] == true
      Reimbursement.find(data['id']).delete
      render json: {message: 'Delete Successful'}, Status: :ok
    else
      r = Reimbursement.select('id').where(user_id: @current_user['id'], id: data['id'])
      if r.empty?
        puts" I'm Empty!!!!!!!!!!!!!!!!!!!!!!!!!!"
        render json: {message: 'reimbursement not found!'}, status: :bad_request
      else
        Reimbursement.destroy(data['id'])
        render json: {message: 'Delete Successful'}, status: :ok
      end
    end
  end
end
