class Recipe < ApplicationRecord
  before_save :default_values
    
  belongs_to :recipe_category
  belongs_to :user
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :menu_recipes, dependent: :destroy
  has_many :menus, through: :menu_recipes
  has_many :compositions, dependent: :destroy
  has_many :ingredients, through: :compositions
  has_many :likes, dependent: :destroy
  has_one_attached :picture

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :price_indicator, presence: true
  validates :recipe_category_id, presence: true

  before_create :default_picture

  default_scope { order(created_at: :desc) }

  def default_picture
    self.picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_recipe.jpg')), filename: 'default_recipe.jpg', content_type: 'image/jpg')
  end 
  
  def get_ingredients_number_from_new_recipe_form(params)
    ingredients  = []
    params.each do |ingredient|
      if ingredient != '0'
        ingredients << ingredient.to_i
      end
    end
    return ingredients
  end
  
  def translate_input_ingredients_into_database_ingredients_ids(params)
    selected_ingredients = params.split(', ') # je récupère les ingrédients sélectionnés en splittant à chaque espace
    selected_ingredients_objects = [] # initialisation du tableau qui va contenir les ids d'ingrédients
    selected_ingredients.each do |ingredient_name| # pour chaque nom d'ingrédient entré dans ma barre de recherche
      Ingredient.all.each do |ingredient| # et pour chaque ingrédient présent dans ma BDD
        if ingredient_name == ingredient.name # je compare l'entrée avec les noms
          selected_ingredients_objects << ingredient # s'il existe, j'enregistre l'id
        end
      end
    end
      return selected_ingredients_objects
  end

  def find_recipes_associated_with_ingredients(ingredients)
    all_recipes = Recipe.where(is_displayed: true)
    matching_recipes = []
    all_recipes.each do |recipe|
      if (ingredients - recipe.ingredients).empty? 
        matching_recipes << recipe
      end
    end
    return matching_recipes
  end  

  def picture_300
    return self.picture.variant(resize: '300x300')
  end  

  def default_values
    self.is_displayed ||= false
  end
  
end
