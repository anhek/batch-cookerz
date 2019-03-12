class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @menus = Menu.where(user_id:params[:id])
    @likes = Like.where(user_id:params[:id])
    recipes_ids = []
    @likes.each do |like|
      recipes_ids << like.recipe_id
    end 
    puts recipes_ids
    @recipes =[]
    recipes_ids.each do |id|
      @recipes << Recipe.find(id)
    end 
  end 
   

  def edit 
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end 
  
  private

  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :nickname)
  end 

end 
