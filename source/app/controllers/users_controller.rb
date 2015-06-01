class UsersController < ApplicationController
  # before_filter :redirect_if_logged_in

  def show
    redirect_if_logged_in
    @user = current_user
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in? == false
  end
end
