class DropMenuUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :menu_users
  end
end
