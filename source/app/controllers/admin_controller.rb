class AdminController < ApplicationController
  def index
    redirect_to not_an_admin_path unless is_admin?
  end

  def not_an_admin
  end

  private

  def is_admin?
    return false if current_user.nil?
    current_user.user_type == 'admin'
  end
end
