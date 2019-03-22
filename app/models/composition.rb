class Composition < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :quantity, 
  presence: true,
  numericality: { greater_than: 0 }

end