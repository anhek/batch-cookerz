class ShoppingListsController < ApplicationController
  def create
    puts "Bonjour et bienvenue dans le create de shopping list"
    menu = Menu.find(params[:menu_id])
    menu_recipes = MenuRecipe.where(menu_id: menu.id)
    
    recipes = []
    menu_recipes.each do |menu_recipe|
      
    end
  end
end
