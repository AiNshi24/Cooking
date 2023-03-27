class Public::RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @recipes = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipes : Recipe
    if user_signed_in?
      @recipes = @recipes.includes([:user], [:book_marks]).page(params[:page])
    else
      @recipes = @recipes.includes([:user]).page(params[:page])
    end
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    @procedure = @recipe.procedures.build
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
    # @comments = @recipe.comments
    @comment = current_user.comments.new
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
        procedures_attributes: [:id, :description, :_destroy])
    end
    
    # アクセス制限
    def is_matching_login_user
      @recipe = Recipe.find(params[:id])
      unless @recipe.user == current_user
        redirect_to recipes_path
      end
    end
  
end
