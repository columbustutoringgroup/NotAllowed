class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
  end

  def create
    puts 'HERE'
    redirect_to 'sessions#index'
  end

  def destroy
  end

end
