class RecipesController < ApplicationController

  def index
    recipe = Recipe.new
    unless params[:ingredient].to_s.empty? 
      puts '$' * 60
      selected_ingredients = params[:ingredient].split
      puts "Les ingrédients sélectionnés sont #{selected_ingredients}"
      selected_ingredients_ids = []
      selected_ingredients.each do |ingredient_name|
          Ingredient.all.each do |ingredient|
            if ingredient_name == ingredient.name 
              selected_ingredients_ids << ingredient.id
            end
          end
        print "Les id des ingrédients sélectionnés sont : #{selected_ingredients_ids}."
        @recipes = recipe.find_recipes_associated_with_ingredients(selected_ingredients_ids)
      end

    else
    @recipes = Recipe.all
    end
  end

  def new 
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(name: params[:recipe][:name], description: params[:recipe][:description], recipe_category_id: params[:recipe][:recipe_category])
    ingredients = recipe.get_ingredients_number_from_new_recipe_form(params[:recipe][:ingredient])

      if recipe.save
        ingredients.each do |ingredient_id|
          composition = Composition.new(recipe_id: recipe.id, ingredient_id: ingredient_id)
          composition.save
        end
        redirect_to recipes_path
    else 
      render new_recipe_path
      puts "Désolé, mais la recette n'a pas été enregistrée !"   
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
  end 
  
  private

  def recipe_params
    params.require(:recipe).permit(:ingredient)
  end

  def included_in?(array)
    array.to_set.superset?(self.to_set)
  end

end
