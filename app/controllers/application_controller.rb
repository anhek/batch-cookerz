class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  


  def all_recipes_displayable
    Recipe.where(is_displayed: true)
  end
end
