class UsersController < ApplicationController
  def secret
    unless session[:user_id] && User.find(session[:user_id])
      flash.notice = "Not authorized"
      redirect_to root_path
    end
  end

  def create
    if @user = User.create(user_params)
      flash.notice = "Success"
      session[:user_id] = @user.id
    else
      flash.notice = "Failure"
    end
    redirect_to root_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
