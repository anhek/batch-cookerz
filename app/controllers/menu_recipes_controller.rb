class MenuRecipesController < ApplicationController
   before_action :authenticate_user!, only: [:create]
   autocomplete :recipe, :name

  def create
    if params[:menu_recipe]
      recipe = Recipe.find_by(name: params[:menu_recipe][:recipe_id])
      menu = Menu.find(params[:menu_recipe][:menu_id].to_i)
      menu_recipe = MenuRecipe.new(recipe_id: recipe.id, menu_id: menu.id)
    else
      recipe = Recipe.find(params[:recipe_id])
      menu = Menu.find(params[:menu_id])
      menu_recipe = MenuRecipe.new(recipe_id: recipe.id, menu_id: menu.id)
    end

    if menu_recipe.save
      flash[:success] = "La recette a bien été ajoutée à ton menu !"
      redirect_to user_menu_path(current_user, menu)
    else
      flash[:error] = "Désolé, la recette n'a pas été ajoutée !"
      redirect_to user_menu_path(current_user, menu)
    end
  end

  def destroy
    @menu_recipe =  MenuRecipe.find(params[:menu_recipe_id])
    @menu_recipe.destroy
    redirect_to user_menu_path(current_user)
  end
end
