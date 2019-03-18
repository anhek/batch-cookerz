class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

    def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.picture.purge
    @recipe.picture.attach(params[:picture])
    redirect_to(recipe_path(@recipe))
  end


end
