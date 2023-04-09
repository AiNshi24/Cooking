class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to admin_user_path(@user.id)
    else render :edit
    end 
  end 
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :introduction, :profile_image, :is_deleted)
    end
    
end
