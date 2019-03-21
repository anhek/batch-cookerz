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
    
  def show
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: @recipe.id)
    @comment = Comment.new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end 

  def new 
    @recipe = Recipe.new
    @recipe_categories = RecipeCategory.all
    @price_indicators = ["€", "€ €", "€ € €", "€ € € €", "€ € € € €"]
  end

  def create
    puts '$' * 60
    puts params.inspect
    @recipe = Recipe.new(
      name: params[:name], 
      description: params[:description], 
      recipe_category_id: params[:recipe_category].to_i,
      price_indicator: params[:price_indicator].to_i, 
      cooking_time: params[:cooking_time], 
      preparation_time: params[:preparation_time], 
      user_id: current_user.id)
      ingredients_ids = params[:ingredient_ids]

    if @recipe.save
      @recipe.picture.attach(params[:picture])
      ingredients_ids.each do |ingredient_id|
        params[:quantities].each do |key, value|
          if ingredient_id == key 
            composition = Composition.new(recipe_id: @recipe.id, ingredient_id: ingredient_id.to_i, quantity: value.to_i)
            composition.save 
          end
        end
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

    
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_categories = []
    RecipeCategory.all.each do |recipe|
      @recipe_categories << [recipe.name, recipe.id]
    end
    @price_indicators = [["€", 1], ["€ €", 2], ["€ € €", 3], ["€ € € €", 4], ["€ € € € €",5]]
  end 

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(update_params)
    
    redirect_to recipe_path(@recipe)
  end
  
  private

  def post_params
    params.require(:recipe).permit(:ingredient, :picture)
  end

  def included_in?(array)
    array.to_set.superset?(self.to_set)
  end

  def update_params
    params[:recipe].permit(:name, :recipe_category, :price_indicator, :preparation_time, :cooking_time)
  end

end