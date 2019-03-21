module RecipesHelper

  def is_current_user_the_creator(recipe)
    if user_signed_in?
      if current_user.id == recipe.user_id
        return true
      end
    end
  end

end
