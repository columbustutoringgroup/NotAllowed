require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
		@non_admin = users(:non_admin)
		@admin_user = users(:admin_user)
	end

  test "redirects admin when not logged in" do
    get :admin
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirects dashboard when not logged in" do
    get :dashboard
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirects admin when not administrator" do
    # To log in, set session[:user_id]
		session[:user_id] = @non_admin.id
		get :admin
		assert_redirected_to root_url
	end

	test "shows admin page to administrator" do
	  session[:user_id] = @admin_user.id
		get :admin
		assert flash.empty?
	  assert_response :success	
	end

end
