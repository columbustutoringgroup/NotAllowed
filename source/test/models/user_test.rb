require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "when saving a new user" do
    # Fails if there is no password
    assert_not User.new({user_name: 'Bill'}).save

    # Fails if the password is too short
    assert_not User.new({user_name: 'Bill', password: '1234'}).save

    # Succeeds when given a valid password
    valid_passwords = ['asdoifho132',
                       '12391987879',
                       'the yellow badger ate the moon']

    valid_passwords.each do |pass|
      assert User.new({user_name: 'Bill', password: pass}).save
    end
  end
end
