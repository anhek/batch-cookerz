class ShoppingListsController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    menu_recipes = MenuRecipe.where(menu_id: menu.id)
    
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
    recipes.each do |recipe|
    end

    @grouped_ingredients = @ingredients.group_by(&:id)
    @shopping_list = ShoppingList.new(menu_id: menu.id, ingredients_qty: @grouped_ingredients.count)
    if @shopping_list.save
      puts "C'est bon, c'est sauvegardé !"
    else 
      puts "Oups, petit problème !"
    end
  
  end



  def show
    menu = Menu.find(params[:menu_id])
    menu_recipes = MenuRecipe.where(menu_id: menu.id)
    
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
    
    # puts "Les noms des recettes incluses :"
    recipes.each do |recipe|
      # puts recipe.name
    end

    # puts "Le nombre de compositions :"
    # puts compositions.count


    # puts "Le nombre d'ingrédients avant : "
    # puts @ingredients.count
    @grouped_ingredients = @ingredients.group_by(&:id)
    puts "Le nombre d'ingrédients après"
    puts @grouped_ingredients.count

    sums = []
    @grouped_ingredients.each do |key, value|
      id_sum_hash = Hash.new
      sum_for_one_ingredient = 0
      compositions.each do |composition|
        if key == composition.ingredient_id 
          sum_for_one_ingredient += composition.quantity
        end
      end
      id_sum_hash[key] = sum_for_one_ingredient
      sums << id_sum_hash
    end
    # puts "Le hash final ressemble à : "
    # print sums

  


  end
end
