class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :number_of_recipes

      t.timestamps
    end
  end
end
