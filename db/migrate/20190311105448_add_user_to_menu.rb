class AddUserToMenu < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :user, foreign_key: true
  end
end
