class SessionsController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.nil?
      flash[:login_error] = 'Login Error occured'
      redirect_to '/' and return
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/profile'
    end

    flash[:login_error] = 'Incorrect Email or Password'
    redirect_to '/' and return

  end



  def destroy
    session[:user_id] = nil
    flash[:logout] = 'You have been successfully logged out.'
    redirect_to '/'
  end



end
