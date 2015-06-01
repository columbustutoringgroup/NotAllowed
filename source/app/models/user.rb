class User < ActiveRecord::Base
  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password_attempt)
    user = User.find_by(email: email)
    return user if user && (user.password == password_attempt)
    nil
  end
end
