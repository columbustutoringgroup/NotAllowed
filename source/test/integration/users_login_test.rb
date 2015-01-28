require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?, "flash should not be empty"
    get root_path
    assert flash.empty?, "flash should be empty"
  end

  test "login with valid information followed by logout" do
    get login_path
    assert_template 'sessions/new', "should be on login form"
    post login_path, session: { email: 'john.smith@example.com', password: 'password' }
    assert_redirected_to @user, "should be redirected to user's profile"
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, {count: 0}, "should not have login link"
    assert_select "a[href=?]", logout_path, {}, "should have logout link"
    assert_select "a[href=?]", user_path(@user), {}, "should have profile link"
    assert is_logged_in?, "should be logged in"
    delete logout_path
    assert_not is_logged_in?, "shouldn't be logged in"
    assert_redirected_to root_url, "should be redirected to root page"
    follow_redirect!
    assert_select "a[href=?]", login_path, {}, "should have login link"
    assert_select "a[href=?]", logout_path, {count: 0}, "should not have logout link"
    assert_select "a[href=?]", user_path(@user), {count: 0}, "should not have profile link"
  end
end
