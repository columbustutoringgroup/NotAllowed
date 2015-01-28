class User < ActiveRecord::Base
  EMAIL_ADDRESS_REGEX = /\A[a-z0-9\.\-_]+@[a-z0-9\.\-_]+\.[a-z0-9\.\-_]+\z/i 
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: EMAIL_ADDRESS_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  has_secure_password
  before_save { self.email = email.downcase }

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end
end
