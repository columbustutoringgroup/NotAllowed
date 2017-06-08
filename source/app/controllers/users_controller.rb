class UsersController < ApplicationController
  before_action :set_user, only: [:show, :admin]
  before_action :authorize, only: [:show]
  before_action :restrict_to_admin, only: [:admin]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  def admin
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    logged_in? ? @user = current_user : (redirect_to root_path, alert: "Please log in.")
  end

  def authorize
    (redirect_to @user, alert: "You are not logged in as that user.") unless current_user.id == params[:id].to_i
  end

  def restrict_to_admin
    (redirect_to @user, alert: "You are not an admin.") unless current_user.admin?
  end
end
