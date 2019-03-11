class MenusController < ApplicationController

  def show
    @menu = Menu.find(params[:id])
    @recipes = MenuRecipe.where(menu_id: params[:id])
  end


end