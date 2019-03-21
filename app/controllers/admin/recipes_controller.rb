class Admin::RecipesController < ApplicationController
  before_action :check_if_admin 
  
  def index
    @recipes = Recipe.all
  end

  def check_if_admin
    if user_signed_in?
      current_user.is_admin == true
    end
 end


end
