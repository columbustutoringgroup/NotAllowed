class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def show
  end

  def create
    user = User.create(
      email: params[:email],
      password: params[:password],
    )
    user.save!
    redirect_to root_path
  end
end
