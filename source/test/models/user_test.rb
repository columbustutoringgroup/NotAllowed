require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fails when user_name is not present" do
    assert_not User.new({password: '120397904'}).valid?
  end

  test "fails when user_name is too short" do
    assert_not User.new({user_name: 'z', password: '234781324'}).valid?
  end
end
