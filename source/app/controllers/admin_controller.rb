class AdminController < ApplicationController
  before_action :authenticate_user, :check_admin

  def index
  end
end
