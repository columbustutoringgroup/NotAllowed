class SessionsController < ApplicationController

  def index
    check if the user is logged in
      yes: redirect to appropriate secret user page
      otherwise display login page (sessions/index)
  end

  def create
    # reminder on authenticate:
    # compares bcrypt hash of password to password_digest
    # stored in the User model
    # if these are equal, returns the user object
    # otherwise returns false

    session[:user] = User.authenticate(user_name, password)
    redirect_to ...
  end

  def destroy
    reset_session
    redirect_to login page
  end

end
