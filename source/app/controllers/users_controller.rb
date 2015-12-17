class UsersController < ApplicationController
  def index
    logged_in? ? redirect_to(current_user) : redirect_to(login_path)
  end

  def show
    if owns_account? or is_admin?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private

    def owns_account?
      params[:id].to_i == current_user.id
    end
end
