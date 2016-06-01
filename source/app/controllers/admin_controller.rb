class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.all
  end

  protected
    def authenticate_admin
      if session[:user] && session[:user]["id"] && @user = User.find_by(id: session[:user]["id"])
        redirect_to dashboard_url, notice: "You need to be an admin to do that" unless @user.admin
      else
        p "Session[:user]: " + session[:user].to_s
        redirect_to root_url, notice: "You need to log in to do that"
      end
    end
end
