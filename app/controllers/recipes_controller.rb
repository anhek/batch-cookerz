class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new 
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new()
    @ingredients = []
    params[:recipe][:ingredient].each do |ingredient|
      if ingredient != '0'
        @ingredients << ingredient.to_i
      end
    end
    print "La liste des ingrédients est #{@ingredients}"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
  end 
  
  private 

  def recipe_params
    puts
    params[:recipe].permit(:name, :description, :preparation_time, :cooking_time)
  end
end
