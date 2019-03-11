class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
