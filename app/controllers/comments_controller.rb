class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :is_my_comment!, only: [:destroy]
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(user_id: current_user.id, recipe_id: @recipe.id, description: params[:comment][:description])

    if @comment.save
      flash[:success] = "Ton commentaire a bien été ajouté !"
      redirect_to recipe_path(@recipe)
    end 
  end 

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:comment_id])

    @comment.destroy
    flash[:success] = "Ton commentaire a été supprimé !"
    redirect_to recipe_path(@recipe)
  end

  private

  def is_my_comment!
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.user != current_user 
      flash[:error] = "Tu ne peux pas supprimer les commentaires des autres !"
      redirect_to recipe_path(@recipe)
    end
  end

  def check_if_admin!
    if current_user.is_admin == false
      flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
      redirect_to root_path
    end
  end

end
