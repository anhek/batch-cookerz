class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.decimal :price
      t.references :ingredient_category, foreign_key: true

      t.timestamps
    end
  end
end
