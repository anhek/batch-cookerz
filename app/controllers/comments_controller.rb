class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :is_my_comment!, only: [:destroy]
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = Comment.new(user_id: current_user.id, recipe_id: @recipe.id, description: params[:comment][:description])
    if comment.save
      redirect_to recipe_path(@recipe)
    end 
  end 

  def destroy
    puts params.inspect
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def is_my_comment!
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.user != current_user 
      flash[:error] = "Supprime pas les commentaires des autres fdp"
      redirect_to recipe_path(@recipe)
    end
  end

end
