class LikesController < ApplicationController

    before_action :find_recipe
    before_action :find_like, only: [:destroy]
    before_action :authenticate_user!

  def create
    if already_liked?
      flash[:notice] = "Tu ne peux liker qu'une seule fois !"
    else 
    @recipe.likes.create(user_id: current_user.id)
    end 
    redirect_to request.referrer
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "On ne peut pas unliker plusieurs fois !"
    else
      @like.destroy
    end
    redirect_to request.referrer
  end


  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, recipe_id: params[:recipe_id]).exists?
  end

  def find_like
   @like = @recipe.likes.find(params[:id])
end

end
