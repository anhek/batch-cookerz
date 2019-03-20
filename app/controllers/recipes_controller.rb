class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  autocomplete :ingredient, :name, :display_value => :funky_method

  def index
    recipe = Recipe.new
    unless params[:ingredient].to_s.empty? 
      puts params.inspect
      selected_ingredients = recipe.translate_input_ingredients_into_database_ingredients_ids(params[:ingredient])
      @recipes = recipe.find_recipes_associated_with_ingredients(selected_ingredients)
    else
      @recipes = Recipe.all
    end

    @menu_recipe = MenuRecipe.new
  end

  def new 
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(
      name: params[:name], 
      description: params[:description], 
      price_indicator: params[:price_indicator].to_i, 
      cooking_time: params[:cooking_time], 
      preparation_time: params[:preparation_time], 
      recipe_category_id: 1,
      user_id: current_user.id)
    ingredients = "pomme", "patate"

    if @recipe.save
      @recipe.picture.attach(params[:picture])
      ingredients.each do |ingredient_id|
        composition = Composition.new(recipe_id: @recipe.id, ingredient_id: ingredient_id)
        composition.save
      end
      # saving_picture
      flash[:success] = "Ta recette a bien été sauvegardée !"
      redirect_to recipe_path(@recipe.id)
    else 
      render new_recipe_path
      flash[:error] = "Désolé, ta recette n'a pas été sauvegardée !"
      puts @recipe.errors.full_messages
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end 
  
  private

  def post_params
    params.require(:recipe).permit(:ingredient, :picture)
  end

  def included_in?(array)
    array.to_set.superset?(self.to_set)
  end

end
