class AdminController < ApplicationController
  def index
    redirect_to not_an_admin_path unless is_admin?
  end

  def not_an_admin
  end
end
