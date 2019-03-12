class Recipe < ApplicationRecord
    
    belongs_to :recipe_category
    has_many :users, through: :likes
    has_many :users, through: :comments
    has_many :menus, through: :menu_recipes
    has_one :category
    has_many :ingredients, through: :compositions
    has_many :likes, dependent: :destroy

end
