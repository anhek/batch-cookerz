class Menu < ApplicationRecord
  before_save :default_values

  belongs_to :user
  has_many :menu_recipes, dependent: :destroy
  has_one :shopping_list, dependent: :destroy
  has_many :recipes, through: :menu_recipes
  has_one :shopping_list, dependent: :destroy 
  
  
  validates :user, presence: true
  
  def default_values
    self.number_of_people ||= 1
  end

end
