class SessionsController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.find_by(username: login_params[:username])
    if session[:user] = authenticate_and_hash(@user)
      flash[:notice] = "Successfully logged in #{session[:user][:username]}"
    else
      flash[:notice] = "Incorrect username or password"
    end
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

  def dashboard
    @user = session[:user]
    p @user
    p @user["username"]
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end

  def authenticate_and_hash(user)
    @user.authenticate(login_params[:password]) ? {username: user.username, id: user.id} : nil
  end

end
