class MenuRecipesController < ApplicationController
  def create
    puts '$' * 60
    puts params.inspect
    redirect_to recipes_path
  end
end
