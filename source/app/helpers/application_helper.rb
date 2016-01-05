module ApplicationHelper
  def is_signed_in
    !session[:user_id].nil?
  end

  def is_admin
    admin = session[:is_admin]
    if admin.nil?
      return false
    end
    admin
  end
end
