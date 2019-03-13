class Recipe < ApplicationRecord
    
    belongs_to :recipe_category
    has_many :users, through: :likes
    has_many :users, through: :comments
    has_many :menus, through: :menu_recipes
    has_many :ingredients, through: :compositions
    has_many :likes, dependent: :destroy

    def get_ingredients_number_from_new_recipe_form(params)
        ingredients  = []
        params.each do |ingredient|
            if ingredient != '0'
              ingredients << ingredient.to_i
            end
          end
        return ingredients
    end

    def find_recipes_associated_with_ingredients(ingredients)
      selected_ingredients = ingredients
      print "Les ingrédients sélectionnés sont : #{selected_ingredients}"

      recipes = []
      all_recipes = Recipe.all       
      all_recipes.each do |recipe| # pour chaque recette 
        composition = Composition.where(recipe_id: recipe.id) # je crée un array qui contient tous les ingredients_ids de la recette
        ingredients_ids = [] # initialisation d'un tableau d'ingrédients id
        composition.each do |element| # pour chaque position, 
          ingredients_ids << element.ingredient_id # je récupère les ingrédients  id de la recette
        end
        print ingredients_ids
        if (selected_ingredients & ingredients_ids).any?
          puts "$" * 60
          puts "Je trouve bien les ingrédients"
          recipes << Recipe.find(recipe.id)
        end
      end
      return recipes
    end
end
