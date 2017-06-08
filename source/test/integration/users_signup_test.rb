require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid sign up information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, user: { name: "Adam Zadinko",
                                email: "adam.zadinko@example.com",
                                password: "abc",
                                password_confirmation: "def" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect signup_path, user: { name: "King Tut",
                                             email: "kingtut@example.com",
                                             password: "imtheking",
                                             password_confirmation: "imtheking" }
    end
    assert_template 'users/show'
  end
end
