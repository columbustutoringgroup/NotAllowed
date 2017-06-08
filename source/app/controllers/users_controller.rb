class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user] = {username: @user.username, id: @user.id}
    redirect_to dashboard_url
  end

  def show
    @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:id, :admin, :username, :password, :password_confirmation)
  end
end
