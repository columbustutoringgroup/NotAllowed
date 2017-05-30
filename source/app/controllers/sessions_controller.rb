class SessionsController < ApplicationController

  def index
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash.notice = "Success"
      redirect_to @user.admin ? secret_path : secret_users_path
    else
      flash.notice = "Failure"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end

end
