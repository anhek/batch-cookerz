class Admin::RecipesController < ApplicationController
  before_action :check_if_admin 
  
  def index
    @recipes = Recipe.all.sort
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.is_displayed = !@recipe. is_displayed
    @recipe.save
    
    redirect_to admin_recipes_path
  end

  def check_if_admin
    if user_signed_in?
      current_user.is_admin == true
    end
 end


end
