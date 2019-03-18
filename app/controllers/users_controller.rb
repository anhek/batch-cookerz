class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :is_my_profile!
  #layout 'history_menus' /#pour utiliser ce render, les views des menus doivent etre dans un fichier /layouts/menus
  #layout 'favorite_recipes' 

  def show
    @user = User.find(params[:id])
    @menus = Menu.where(user_id:params[:id])
    @likes = Like.where(user_id:params[:id])
    @recipes = @user.find_liked_recipes(@likes)
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

  def is_my_profile!
    if User.find(params[:id]) != current_user.id
      flash[:error]= "Reste sur ton profil !"
      redirect_to root_path
    end
  end 
end 
