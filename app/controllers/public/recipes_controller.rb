class Public::RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
  end
  
  def create
  @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "レシピを投稿しました。"
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
    flash[:notice] = "レシピを更新しました。"
    redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end
  
  private

    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :image, tag_ids: [],
        ingredients_attributes: [:id, :content, :quantity, :_destroy],
        procedures_attributes: [:id, :description, :image, :_destroy])
    end
    
    # アクセス制限
    def is_matching_login_user
      @recipe = Recipe.find(params[:id])
      unless @recipe.user == current_user
        redirect_to recipes_path
      end
    end
  
end
