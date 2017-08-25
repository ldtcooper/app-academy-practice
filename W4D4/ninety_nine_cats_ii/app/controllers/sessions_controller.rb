class SessionsController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  before_action :redirect_if_logged_in!, only: [:create, :new]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if user.nil?
      flash.now[:errors] = 'Credentials were wrong'
      render :new
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
