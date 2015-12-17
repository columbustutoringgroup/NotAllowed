class User < ActiveRecord::Base
  attr_reader :user_name

  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :user_name, presence: true, length: { minimum: 2 },
            uniqueness: true
end
