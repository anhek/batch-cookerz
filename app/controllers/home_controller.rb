class HomeController < ApplicationController
  def index
    @ingredients_rand = Ingredient.all.sample(5)
  end
end
