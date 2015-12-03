class SessionsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      current_user = user
      
      redirect_to user
    else
      render 'index'
    end
  end

  def destroy
  end

  # def log_in
  #   session[user_id] = user.id
  # end

  # def 

end
