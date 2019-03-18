class Ingredient < ApplicationRecord

  belongs_to :ingredient_category
  has_many :recipes, through: :compositions

  validates :name, presence: true, length: { in: 3..50 }
  validates :calories, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 999 }


end
