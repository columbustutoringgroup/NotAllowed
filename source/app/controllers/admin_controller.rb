class AdminController < ApplicationController
  before_action :require_admin

  def show
  end

  private
    def require_admin
      unless logged_in? && admin?
        flash[:danger] = "Don't try it, buster"
        redirect_to root_url
      end
    end

    def admin?
      User.find(session[:current_user_id]).admin
    end
end
