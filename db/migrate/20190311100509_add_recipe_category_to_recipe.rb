class AddRecipeCategoryToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :recipe_category, foreign_key: true
  end
end
