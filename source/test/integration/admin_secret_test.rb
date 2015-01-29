require 'test_helper'

class AdminSecretTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = users(:maria)
    @user = users(:john)
  end

  test "not logged in and attempting to access TOP SECRET page" do
    get root_url
    assert_select "a[href=?]", top_secret_path, {count: 0}, "should not have TOP SECRET link"
    get top_secret_path
    assert_redirected_to root_url, "should be redirected to root url"
    follow_redirect!
    assert_select "div.alert.alert-error", {}, "should display an error"
    assert_template "sessions/index"
  end

  test "logged in as normal user and attempting to access TOP SECRET page" do
    get login_path
    assert_template 'sessions/new', "should be on login page"
    post login_path, session: { email: @user.email, password: "password" }
    assert_redirected_to @user, "should be redirected to user's profile"
    follow_redirect!
    assert is_logged_in?, "should be logged in"
    assert_template "users/show", "should be on user's profile"
    assert_select "a[href=?]", top_secret_path, {count: 0}, "should not have TOP SECRET link"
    get top_secret_path
    assert_redirected_to root_url, "should be redirected to root url"
    follow_redirect!
    assert_select "div.alert.alert-error", {}, "should have an error message"
    assert_template "sessions/index"
  end
  
  test "logged in as admin and attempting to acces TOP SECRET page" do
    get login_path
    assert_template 'sessions/new', "should be on login page"
    post login_path, session: { email: @admin_user.email, password: "password" }
    assert_redirected_to @admin_user, "should be redirected to user's profile"
    follow_redirect!
    assert is_logged_in?, "should be logged in"
    assert_template "users/show", "should be on user's profile"
    assert_select "a[href=?]", top_secret_path, {}, "should have TOP SECRET link"
    get top_secret_path
    assert_template "admin/secret", "should be on TOP SECRET page"
  end
end
