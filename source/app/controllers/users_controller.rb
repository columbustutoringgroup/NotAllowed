require "byebug"

class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id]) if session[:user_id]
    if @user.nil?
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !@user.id.nil?
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:signup_error] = 'An error occurred while signing up.'
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
