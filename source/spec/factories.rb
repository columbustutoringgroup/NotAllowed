require "faker"

FactoryGirl.define do
  factory :user do |u|
    u.email Faker::Internet.email
    password = Faker::Internet.email
    u.password password
    u.password_confirmation password
  end

end
