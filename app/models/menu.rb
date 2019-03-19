class Menu < ApplicationRecord

    belongs_to :user
    has_many :menu_recipes, dependent: :destroy
    has_one :shopping_list, dependent: :destroy
    has_many :recipes, through: :menu_recipes
    has_one :shopping_list
    
    
    validates :user, presence: true
    # validates :recipes, presence: true
end
