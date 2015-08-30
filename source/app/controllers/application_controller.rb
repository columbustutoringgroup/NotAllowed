class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user

  def logged_in?
    not session[:user_id].nil?
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def authenticate_user
    unless logged_in?
      puts 'NOT LOGGED IN'
      user = User.find_by_email(params[:email])
      puts user
      puts params[:password] + " is the password" if params[:password]
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        puts 'AUTHENTICATION FAILED'
        flash[:error] = "Please log in first"
        redirect_to '/sessions#index'
      end
    else
      puts 'ALREADY LOGGED IN'
    end
  end

  def authorize_user
    if current_user.admin?
      puts 'ADMIN PASS'
    else
      puts 'AUTHORIZATION FAILED'
      flash[:error] = "you need to be an admin"
      redirect_to '/users'
    end
  end

end
