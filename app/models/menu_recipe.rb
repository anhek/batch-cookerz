class MenuRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :menu
end
