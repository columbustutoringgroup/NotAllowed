class SessionsController < ApplicationController

  def index
    redirect_to current_user if logged_in?
  end

  def create
    user_name = params[:session][:user_name]
    password  = params[:session][:password]
    user = User.find_by(user_name: user_name)

    if user && user.authenticate(password)
      log_in user
      redirect_to user
    else
      flash[:notice] = "Invalid username or password"
      render 'index'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
