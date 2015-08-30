class AdminController < ApplicationController
  before_filter :authorize_user

  def show
  end
end
