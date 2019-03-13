class RecipesController < ApplicationController

  def index
    puts '$' * 60
    selected_ingredients = params[:ingredient].split(' ')
    selected_ingredients = selected_ingredients.map(&:to_i)
    print "Les ingrédients sélectionnés sont : #{selected_ingredients}"

    @recipes = []
    @all_recipes = Recipe.all       
    @all_recipes.each do |recipe| # pour chaque recette 
      composition = Composition.where(recipe_id: recipe.id) # je crée un array qui contient tous les ingredients_ids de la recette
      ingredients_ids = [] # initialisation d'un tableau d'ingrédients id
      composition.each do |element| # pour chaque position, 
        ingredients_ids << element.ingredient_id # je récupère les ingrédients  id de la recette
      end
      print ingredients_ids
      if (selected_ingredients & ingredients_ids).any?
        puts "$" * 60
        puts "Je trouve bien les ingrédients"
        @recipes << Recipe.find(recipe.id)
      end
    end

    
  end

  def new 
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(name: params[:recipe][:name], description: params[:recipe][:description], recipe_category_id: params[:recipe][:recipe_category])
    ingredients = recipe.get_ingredients_number_from_new_recipe_form(params[:recipe][:ingredient])

      if recipe.save
        ingredients.each do |ingredient_id|
          composition = Composition.new(recipe_id: recipe.id, ingredient_id: ingredient_id)
          composition.save
        end
        redirect_to recipes_path
    else 
      render new_recipe_path
      puts "Désolé, mais la recette n'a pas été enregistrée !"   
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
  end 
  
  private

  def recipe_params
    params.require(:recipe).permit(:ingredient)
  end

  def included_in?(array)
    array.to_set.superset?(self.to_set)
  end

end
