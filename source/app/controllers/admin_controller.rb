class AdminController < ApplicationController
  def show
  	user = User.find(session[:current_user_id]) if logged_in?
  	if user == nil || user.is_admin != true
		flash[:not_authorized_error]  = "You are not authorized to view the admin page."  
		redirect_to root_path		
  	end  	
  end
end
