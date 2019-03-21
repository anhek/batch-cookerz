module RecipesHelper

  def is_current_user_the_creator?
    current_user.id == @recipe.user_id
  end

  def is_the_menu_already_added?
    MenuRecipe.find { |menu_recipe| menu_recipe.recipe_id == @recipe.id}
  end

end
