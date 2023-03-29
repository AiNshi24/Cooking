class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :withdraw]
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    @bookmarks = BookMark.where(user_id: current_user.id).pluck(:recipe_id)
    @bookmark_list = Recipe.find(book_marks)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to user_path(@user.id)
    else render :edit
    end 
  end 

  def unsubscribe
  end
  
  def withdraw
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      reset_session
      redirect_to root_path
    else
      @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました。"
      redirect_to root_path
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :introduction, :profile_image, :is_deleted)
    end
    
    #アクセス制限
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end
    
end
