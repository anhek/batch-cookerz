class Admin::CommentsController < ApplicationController
  before_action :check_if_admin!

  def destroy
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  def check_if_admin!
    if user_signed_in?
      if current_user.is_admin == false
        flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
        redirect_to root_path
      end
    else
      flash[:error] = "Accès réservé aux meilleurs cuisiniers !"
      redirect_to root_path
    end
  end
end
