require 'rails_helper'
require "awesome_print"

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    @user = create(:user)
    # ap @user
    expect(@user).to be_valid
  end
end
