class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_menu!

  def show
    @menu = Menu.find(params[:id])
    @menu_recipes = MenuRecipe.where(menu_id: params[:id])
    @menu_recipe = MenuRecipe.new
  end

  def update
    puts '$' * 60
    puts params.inspect
    @menu = Menu.find(params[:menu][:menu_id])
    if params[:menu] 
      shopping_list = ShoppingList.find(params[:menu][:shopping_list_id])
      @menu.number_of_people = update_params_from_shopping_list
      @menu.save
    
      redirect_to user_menu_shopping_list_path(current_user, @menu, shopping_list)
    else
      @menu.number_of_people = update_params_from_menu
      @menu.save

      redirect_to user_menu_path(current_user, @menu)
    end
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

  def update_params_from_menu
    params[params.keys[3]][:number_of_people]
  end

  def update_params_from_shopping_list
    params[:menu][:number_of_people]
  end
end