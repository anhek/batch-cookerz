class Admin::RecipesController < ApplicationController
  before_action :check_if_admin!
  
  def index
    @recipes = Recipe.all.sort
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.is_displayed = !@recipe. is_displayed
    @recipe.save
    
    redirect_to admin_recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to admin_recipes_path
  end
  
  private 

  def check_if_admin!
    if current_user.is_admin == false
      flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
      
      redirect_to root_path
    end
  end


end
