class ChangeNumberOfRecipesInMenusName < ActiveRecord::Migration[5.2]
  def change
    rename_column :menus, :number_of_recipes, :number_of_people
  end
end
