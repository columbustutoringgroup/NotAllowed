class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :destroy]

  def index
  end

  def create
    redirect_to '/sessions#index'
  end

  def destroy
    puts 'DESTROYING SESSION'
    #reset_session
    session[:user_id] = nil
    redirect_to '/sessions#index'
  end

end
