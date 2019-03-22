class AvatarsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @user = User.find(params[:user_id])
    @user.avatar.purge
    @user.avatar.attach(params[:avatar])

    flash[:success] = "Ta photo de profil a bien été mise à jour !"
    redirect_to(user_path(@user))
  end
end
