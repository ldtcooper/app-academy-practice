class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: user_id)
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: user_id)
    if @user
      @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: user_id)
    @user.delete
    render json: @user
  end

  private

  def user_params
    params[:user].permit(:username)
  end

  def user_id
    params[:id]
  end
end
