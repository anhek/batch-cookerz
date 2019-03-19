class RecipeCategoriesController < ApplicationController

  def index
    @recipe_categories = RecipeCategory.all
  end

end 