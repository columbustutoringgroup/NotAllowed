class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :user_name, presence: true, length: { minimum: 2 }, uniqueness: true

  def admin?
    user_type == 'admin'
  end

  def owner?(page_id)
    page_id == params[:id]
  end
end
