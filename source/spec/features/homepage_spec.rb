require 'rails_helper'

RSpec.describe "the homepage" do

  it "shows homepage on root" do
    visit '/'
    expect(page).to have_content 'This is the front page!'
  end

  it 'shows homepage when clicking home.' do
    visit '/'
    click_link 'Home'
    expect(page).to have_content 'This is the front page!'
  end
end
