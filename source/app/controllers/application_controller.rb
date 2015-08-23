class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #protect_from_forgery with: :null_session
  before_action :authenticate_user

  def logged_in?
  end

  def current_user
  end

  def authenticate_user
    unless logged_in?
      flash[:error] = "Please log in first"
      redirect_to '/sessions#index'
    end
  end

end
