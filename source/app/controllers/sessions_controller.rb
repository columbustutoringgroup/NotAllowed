class SessionsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(email: session_params[:email]).try(:authenticate, session_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = "Email or password incorrect!"
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
    end

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
