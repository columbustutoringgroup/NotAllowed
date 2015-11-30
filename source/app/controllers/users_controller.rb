class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user && @user.save
      redirect_to @user
    else
      redirect_to root_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
