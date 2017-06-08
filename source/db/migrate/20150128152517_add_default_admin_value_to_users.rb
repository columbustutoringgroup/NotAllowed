class AddDefaultAdminValueToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :admin, false
    change_column_default :users, :admin, false 
  end
end
