require 'rails_helper'
require 'awesome_print'

RSpec.describe "login/logout" do

  before(:all) do
    User.all.each do |item|
      item.destroy
    end
    @user = create(:user, email: 'maxdignan@gmail.com', password: 'diggernan', password_confirmation: 'diggernan')
    @user.is_admin = true
    @user.save!
    # ap @user
  end

  it "shows profile on successful login" do
    visit '/login'
    fill_in 'email', with: 'maxdignan@gmail.com'
    fill_in 'password', with: 'diggernan'
    click_button 'Login'
    expect(page).to have_content "I'm in the show user profile"
    click_link 'Logout'
  end

  it 'shows homepage with error message when unsuccefully logging in' do
    visit '/login'
    fill_in 'email', with: 'maxdignan@gmail.com'
    fill_in 'password', with: 'wrong password'
    click_button 'Login'
    expect(page).to have_content 'This is the front page!'
    expect(page).to have_content 'Incorrect Email or Password'
  end

  it 'shows homepage with logout message when logging out' do
    visit '/login'
    fill_in 'email', with: 'maxdignan@gmail.com'
    fill_in 'password', with: 'diggernan'
    click_button 'Login'
    expect(page).to have_content "I'm in the show user profile"
    click_link 'Logout'
    expect(page).to have_content "You have been successfully logged out."
  end

  it 'shows admin page when admin' do
    visit '/login'
    fill_in 'email', with: 'maxdignan@gmail.com'
    fill_in 'password', with: 'diggernan'
    click_button 'Login'
    expect(page).to have_content "I'm in the show user profile"
    click_link 'Admin'
    expect(page).to have_content "This is the Admin page"
    click_link 'Logout'
    expect(page).to have_content "You have been successfully logged out."
  end
end
