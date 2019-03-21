module RecipesHelper

  def is_current_user_the_creator?
    recipe = @recipe
    current_user == recipe.user_id
  end

end
