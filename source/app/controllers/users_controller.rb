class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path, notice: "Successfully created #{@user.username}'s account!'"
  end

  def show
    @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :password, :password_confirmation)
  end
end
