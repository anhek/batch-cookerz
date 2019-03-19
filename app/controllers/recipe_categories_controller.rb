class RecipeCategoriesController < ApplicationController
 

  def show
    @recipe_category = RecipeCategory.find(params[:id]) 
    @recipes = Recipe.where(recipe_category_id: @recipe_category.id)

  end
    

end