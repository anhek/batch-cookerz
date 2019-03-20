class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_menu!

  def show
    @menu = Menu.find(params[:id])
    @menu_recipes = MenuRecipe.where(menu_id: params[:id])
    @menu_recipe = MenuRecipe.new
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to user_path
  
  end

  private

  def is_my_menu!
    if User.find(params[:user_id]).id != current_user.id
      flash[:error]= "Reste sur ton menu !"
      redirect_to root_path
    end
  end 

end