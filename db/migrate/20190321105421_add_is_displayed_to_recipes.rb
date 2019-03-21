class AddIsDisplayedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :is_displayed, :boolean
  end
end
