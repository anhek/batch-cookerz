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
end
