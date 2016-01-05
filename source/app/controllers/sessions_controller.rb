class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.nil?
      flash[:login_error] = 'Login Error occured'
      redirect_to '/' and return
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:is_admin] = @user.is_admin
      redirect_to '/profile' and return
    end

    flash[:login_error] = 'Incorrect Email or Password'
    redirect_to '/' and return

  end



  def destroy
    session[:user_id] = nil
    session[:is_admin] = nil
    flash[:logout] = 'You have been successfully logged out.'
    redirect_to '/'
  end



end
