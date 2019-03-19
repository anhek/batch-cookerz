class CreateShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_lists do |t|
      t.integer :ingredients_qty
      t.decimal :price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
