class Ingredient < ApplicationRecord

  belongs_to :ingredient_category
  has_many :recipes, through: :compositions
  

end