require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new name: "John Doe", email: "john.doe@example.com", password: "abcdefgh", password_confirmation: "abcdefgh"
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "emails should be email-ish" do
    %w[robert.lude@gmail.com rob@ertlu.de john.doe@example.com].each do |email|
      @user.email = email
      assert @user.valid?, "#{email} should be valid"
    end
    %w[robert.lude john@doe].each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email} shouldn't be valid"
    end
  end

  test "emails should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be at least 8 chars" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

end
