class PicturesController < ApplicationController

    def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.picture.purge
    @recipe.picture.attach(params[:picture])
    redirect_to(recipe_path(@recipe))
  end


end
