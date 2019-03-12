class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new 
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
  end 
  
end
