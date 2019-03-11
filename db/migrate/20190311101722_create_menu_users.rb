class CreateMenuUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_users do |t|
      t.references :menu, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
