class AddAttributesToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password_digest
      t.string :user_name
    end
  end
end
