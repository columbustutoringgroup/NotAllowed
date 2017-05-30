class SessionsController < ApplicationController
  def index
    
  end
  
  def new
    if logged_in?
      redirect_to root_path
    else
      @session = nil    
    end
  end

  def create
    @user = User.authenticate(params[:user_email], params[:user_password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
