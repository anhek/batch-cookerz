class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if params[:picture] != nil
      @recipe.picture.purge
      @recipe.picture.attach(params[:picture])
      redirect_to recipe_path(@recipe)
    else 
      flash[:error] = "Vous devez charger une image !"
      redirect_to recipe_path(@recipe)
    end
  end


end
