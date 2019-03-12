class LikesController < ApplicationController

    before_action :find_recipe

  def create
    @recipe.likes.create(user_id: current_user.id)
    redirect_to recipe_path(@recipe)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end


end
