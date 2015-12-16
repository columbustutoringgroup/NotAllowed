require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "invalid if there is no password" do
    assert_not User.new({user_name: 'Bill'}).valid?
  end

  test "invalid if password is too short" do
    assert_not User.new({user_name: 'Bill', password: '1234'}).valid?
  end

  test "valid when given a valid password" do
    valid_passwords = ['asdoifho132',
                       '12391987879',
                       'the yellow badger ate the moon']

    valid_passwords.each do |pass|
      assert User.new({user_name: 'Bill', password: pass}).valid?
    end
  end
end
