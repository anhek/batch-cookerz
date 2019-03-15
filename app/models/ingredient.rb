class Ingredient < ApplicationRecord

  belongs_to :ingredient_category
  has_many :recipes, through: :compositions

  validates :name, presence: true, length: { in: 3..50 }
  validates :calories, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 999 }

  # Whatever other validations you need:
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}

  # then a custom validation for precision
  validate :price_is_valid_decimal_precision

  private

  def price_is_valid_decimal_precision
    # Make sure that the rounded value is the same as the non-rounded
    if price.to_f != price.to_f.round(2)
      errors.add(:price, "The price of the product is invalid. There should only be two digits at most after the decimal point.")
    end
  end

end
