class Menu < ApplicationRecord

    has_many :users, through: :menu_users
    has_many :recipes, through: :menu_recipes
    
end
