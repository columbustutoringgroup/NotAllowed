class AdminController < ApplicationController
  def index
    unless is_admin?
      flash[:notice] = "You are not an admin!!!! Ha ha ha ha!!!!"
      redirect_to root_path
    end
  end
end
