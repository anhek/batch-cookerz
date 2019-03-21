class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_menu!

  def show
    @menu = Menu.find(params[:id])
    @menu_recipes = MenuRecipe.where(menu_id: params[:id])
    @menu_recipe = MenuRecipe.new
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.number_of_people = update_params
    @menu.save
    
    redirect_to user_menu_path(current_user, @menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to user_path(current_user)
  
  end

  private

  def is_my_menu!
    if User.find(params[:user_id]).id != current_user.id
      flash[:error]= "Reste sur ton menu !"
      redirect_to root_path
    end
  end 

  def update_params 
    params[params.keys[3]][:number_of_people]
  end
end