class Admin::UsersController < ApplicationController
  before_action :check_if_admin!

  def index
    @users = User.all.sort
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)
    
    flash[:success] = " Le profil n°#{@user.id} a bien été mis à jour"
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: params[:id])
    @recipes.each do |recipe|
      recipe.user_id = 2
      recipe.save
    end
    @user.destroy

    redirect_to admin_users_path
  end

  private

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

  def update_params
    params[:user].permit(:first_name, :last_name, :nickname)
  end
end
