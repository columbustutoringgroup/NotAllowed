class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def authenticate_user
    redirect_to "session#new" if !logged_in?
  end

  private

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
