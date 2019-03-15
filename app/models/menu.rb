class Menu < ApplicationRecord

    belongs_to :user
    has_many :recipes, through: :menu_recipes
    
    validates :user, presence: true
    validates :recipes, presence: true
end
