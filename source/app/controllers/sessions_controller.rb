class SessionsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      redirect_to user
    else
      render 'index'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end

end
