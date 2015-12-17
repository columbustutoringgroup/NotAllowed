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
      user_id = User.find_by(user_name: @user[:user_name]).id
      session[:user_id] = user_id
      redirect_to current_user
    else
      redirect_to signup_path
    end
  end

  private

    def owns_account?
      params[:id].to_i == current_user.id
    end

    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation)
    end
end
