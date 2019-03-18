class RenameCostFromRecipe < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :cost, :price_indicator
    change_column :recipes, :price_indicator, :integer
  end
end
