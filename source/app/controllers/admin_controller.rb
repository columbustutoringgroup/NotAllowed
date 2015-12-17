class AdminController < ApplicationController
  def index
    unless current_user.admin?
      flash[:notice] = "You are not an admin!!!! Ha ha ha ha!!!!"
      @user = current_user
      render '/users/show'
    end
  end
end
