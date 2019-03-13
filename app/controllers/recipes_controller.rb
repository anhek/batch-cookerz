class RecipesController < ApplicationController

  def index
    puts '$' * 60
    puts params.inspect
    @recipes = Recipe.all
    
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

end
