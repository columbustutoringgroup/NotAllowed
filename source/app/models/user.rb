class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :user_name, presence: true, length: { minimum: 2 }, uniqueness: true
end
