class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, length: { minimum: 7 }
end
