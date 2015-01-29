require 'test_helper'

class UserSecretTest < ActionDispatch::IntegrationTest
  def setup
    @user = users :john
  end
  
  test "not logged in and attempting to access secret" do
    get root_url
    assert_select "a[href=?]", secret_path, {count: 0}, "should not have secret link"
    get secret_path
    assert_redirected_to root_url, "should be redirected to root url"
    follow_redirect!
    assert_select "div.alert.alert-error", {}, "should have an error"
    assert_template "sessions/index"
  end

  test "logged in and attempting to access secret" do
    get login_path
    assert_template 'sessions/new', "should be on login page"
    post login_path, session: { email: @user.email, password: "password" }
    assert_redirected_to @user, "should be redirected to user's profile"
    follow_redirect!
    assert_template "users/show", "should be on user's profile"
    assert_select "a[href=?]", secret_path, {}, "should have secret link"
    get secret_path
    assert_template "users/secret", "should be on secret page"
  end
end

