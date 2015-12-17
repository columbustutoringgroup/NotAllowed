class AdminController < ApplicationController
  def show
    check that the current user is an admin
      if they are not, redirect to the "you're not an admin" page
      otherwise go to admin page layouts/admims/show
  end

  private

  def is_admin? user
    user.user_type == 'admin'
  end
end
