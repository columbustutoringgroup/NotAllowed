class SessionsController < ApplicationController

  def index
  end

  def create
  	user = User.find_by_name(params[:session][:name])
  	if user.authenticate(params[:session][:password])
  		session[:current_user_id] = user.id
  	else
  		flash[:login_error] = 'Failed to login, wrong username or password.'
  	end
  	render 'index'
  end

  def destroy
  	session[:current_user_id] = nil
  	redirect_to root_path
  end

end
