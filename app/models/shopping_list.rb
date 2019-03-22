class ShoppingList < ApplicationRecord
  belongs_to :menu

  validates :menu, presence: true
  validates :ingredients_qty, presence: true


  def find_number_of_different_ingredients_in_a_menu(menu)
    menu_recipes = MenuRecipe.where(menu_id: menu.id)
    
    recipes = []
    menu_recipes.each do |menu_recipe|
      recipes << Recipe.find(menu_recipe.recipe_id)
    end

    compositions = []
    recipes.each do |recipe|
      compositions << Composition.where(recipe_id: recipe.id)
    end

    compositions = compositions.flatten

    ingredients = []
    compositions.each do |composition|
      ingredients << Ingredient.find_by(id: composition.ingredient_id)
    end
    recipes.each do |recipe|
    end

    grouped_ingredients = ingredients.group_by(&:id)
    return grouped_ingredients
  end

end
