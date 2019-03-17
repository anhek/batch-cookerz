class Menu < ApplicationRecord

    belongs_to :user
    has_many :recipes, through: :menu_recipes
    has_many :shopping_lists
    
    validates :user, presence: true
    # validates :recipes, presence: true
end
