class User < ActiveRecord::Base
  has_secure_password

  # after_create :set_admin_to_false
  #
  # def set_admin_to_false
  #   self.is_admin = false
  #   self.save
  # end
end
