class StaticPagesController < ApplicationController
  before_action :authorize
  before_action :administrator?, only: :admin

  def admin
  end

  def dashboard
  end
end
