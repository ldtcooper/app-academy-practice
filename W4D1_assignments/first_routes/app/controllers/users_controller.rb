class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(user_id)
    render json: user
  end

  def update
    user = User.find(user_id)
    user.update_attributes(params[:user].permit(:name, :email))
    render json: user
  end

  def destroy
    user = User.find(user_id)
    user.delete
    render json: user
  end

  private

  def user_params
    params[:user].permit(:name, :email)
  end

  def user_id
    params[:id]
  end
end
