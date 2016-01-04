class AddEmailHashedPasswordAndIsAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :hashed_password, :string
    add_column :users, :is_admin, :boolean
  end
end
