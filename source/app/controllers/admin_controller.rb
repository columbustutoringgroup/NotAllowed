class AdminController < ApplicationController
  def secret
    unless session[:user_id] && User.find(session[:user_id]) && User.find(session[:user_id]).admin
      flash.notice = "Not authorized"
      redirect_to root_path
    end
  end
end
