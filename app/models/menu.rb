class Menu < ApplicationRecord
  before_save :default_values

  validates :user, presence: true
  validates :number_of_people, presence: true
  

  belongs_to :user
  has_many :menu_recipes, dependent: :destroy
  has_one :shopping_list, dependent: :destroy
  has_many :recipes, through: :menu_recipes
  has_one :shopping_list, dependent: :destroy 
  
  
 
  def default_values
    self.number_of_people ||= 1
  end

end
