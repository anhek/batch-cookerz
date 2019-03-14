class MenusController < ApplicationController

  def show
    @menu = Menu.find(params[:id])
    @menu_recipe = MenuRecipe.where(menu_id: params[:id])
  end


end