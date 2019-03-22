class Admin::RecipesController < ApplicationController
  before_action :check_if_admin!
  
  def index
    @recipes = Recipe.all.sort
  end
    
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_categories = []
    RecipeCategory.all.each do |recipe|
      @recipe_categories << [recipe.name, recipe.id]
    end
    @price_indicators = [["€", 1], ["€ €", 2], ["€ € €", 3], ["€ € € €", 4], ["€ € € € €",5]]
  end 

  
  def update
      @recipe = Recipe.find(params[:id])
    if params[:recipe]
      @recipe.update(update_params)
      
      flash[:success] = "La recette a bien été modifiée !"
      redirect_to admin_recipes_path
    else
      @recipe.is_displayed = !@recipe. is_displayed
      @recipe.save
    
      flash[:success] = "Le statut de la recette #{@recipe.id} a bien été modifié !"
      redirect_to admin_recipes_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to admin_recipes_path
  end
  
  private 

  def update_params
    params[:recipe].permit(:name, :recipe_category_id, :price_indicator, :cooking_time, :preparation_time, :description)
  end

  def check_if_admin!
    if user_signed_in?
      if current_user.is_admin == false
        flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
        redirect_to root_path
      end
    else
      flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
      redirect_to root_path
    end
  end


end
