class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
    end 

    def update
    @user = User.find(params[:id])
    @user.update(user_params)
        if @user.save
            puts "///" * 60
        puts "updated !"
        redirect_to user_path(@user.id)
    else
      render :edit
      puts "kxkxk/" * 60
    end
end 

private

    def user_params
        user_params = params.require(:user).permit(:first_name, :last_name)
    end 

end 