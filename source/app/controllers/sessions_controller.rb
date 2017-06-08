class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:session][:email], params[:session][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path, alert: "Incorrect username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
