class Menu < ApplicationRecord

    has_one :user
    has_many :recipes, through: :menu_recipes
    
end
