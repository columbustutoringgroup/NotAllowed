class UsersController < ApplicationController
  def index
    logged_in? ? redirect_to(current_user) : redirect_to(login_path)
  end

  def show
    selected_user_id = params[:id].to_i || current_user.id

    if current_user.id == selected_user_id || current_user.admin?
      @user = User.find(selected_user_id)
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
      session[:user_id] = @user.id
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation)
    end
end
