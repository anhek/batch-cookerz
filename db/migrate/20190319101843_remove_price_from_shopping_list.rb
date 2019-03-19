class RemovePriceFromShoppingList < ActiveRecord::Migration[5.2]
  def change
    remove_column :shopping_lists, :price, :decimal
  end
end
