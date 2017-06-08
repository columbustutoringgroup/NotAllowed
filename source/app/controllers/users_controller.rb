class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :authenticate_user, only: [:show]

  def show
  end

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

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_page(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
