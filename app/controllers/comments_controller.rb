class CommentsController < ApplicationController

    def create
        @recipe = Recipe.find(params[:recipe_id])
        comment = Comment.new(user_id: current_user.id, recipe_id: @recipe.id, description: params[:comment][:description])
        if comment.save
        redirect_to recipe_path(@recipe)
        end 
  end 

end
