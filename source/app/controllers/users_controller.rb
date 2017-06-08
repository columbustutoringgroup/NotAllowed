class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end

  def secret
    unless logged_in?
      flash[:error] = "You are not authorized to view that page."
      return redirect_to root_url
    end
  end

  private
    
    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation
    end
end
