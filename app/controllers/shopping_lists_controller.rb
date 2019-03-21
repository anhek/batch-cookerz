class ShoppingListsController < ApplicationController
  before_action :already_a_shopping_list_associated_to_the_menu, only: [:create]

  def create
    @shopping_list = ShoppingList.new
    menu = Menu.find(params[:menu_id])
    grouped_ingredients = @shopping_list.find_number_of_different_ingredients_in_a_menu(menu)

    @shopping_list = ShoppingList.new(menu_id: menu.id, ingredients_qty: grouped_ingredients.count)
    if @shopping_list.save
      flash[:success] = "La liste de courses a bien été créée !"
      Menu.create!(user_id: current_user.id)
      redirect_to user_menu_shopping_list_path(current_user, menu, @shopping_list)
      
    else 
      puts "Oups, petit problème !"
    end
  
  end


  def show
    @menu = Menu.find(params[:menu_id])
    menu_recipes = MenuRecipe.where(menu_id: @menu.id)
    
    recipes = []
    menu_recipes.each do |menu_recipe|
      recipes << Recipe.find(menu_recipe.recipe_id)
    end

    compositions = []
    recipes.each do |recipe|
      compositions << Composition.where(recipe_id: recipe.id)
    end

    compositions = compositions.flatten

    @ingredients = []
    compositions.each do |composition|
      @ingredients << Ingredient.find_by(id: composition.ingredient_id)
    end
    
    @grouped_ingredients = @ingredients.group_by(&:name)

    @id_sum_hash = Hash.new
    @grouped_ingredients.each do |key, value|
      sum_for_one_ingredient = 0
      unit_for_one_ingredient = value[0].unit
      compositions.each do |composition|
        if key == composition.ingredient.name
          sum_for_one_ingredient += composition.quantity * @menu.number_of_people
        end
      end
      
      @id_sum_hash[key] = { "sum" => sum_for_one_ingredient }
      @id_sum_hash[key].merge!({'unit' => unit_for_one_ingredient})
    end
  end
  
  private 
  
  def already_a_shopping_list_associated_to_the_menu
    puts 
    puts 
    puts '$' * 60
    puts params.inspect
    puts params[:menu_id]
    puts
    puts ShoppingList.find_by(menu_id: params[:menu_id])
    
    if ShoppingList.find_by(menu_id: params[:menu_id]) != nil
      flash[:error] = " Une liste de courses existe déjà pour ce menu ! "

      redirect_to user_path(current_user)
    end
  end

end
