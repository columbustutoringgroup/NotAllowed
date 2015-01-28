class AdminController < ApplicationController
  include SessionsHelper

  def secret 
    unless logged_in? and current_user.admin
      flash.alert = "You are not authorized to view that page."
      return redirect_to root_url
    end
  end
end
