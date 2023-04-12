class Public::RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @recipes = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipes : Recipe
    if user_signed_in?
      @recipes = @recipes.includes([:user], [:book_marks]).page(params[:page])
    else
      @recipes = @recipes.includes([:user]).page(params[:page])
    end
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
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
    @comment = Comment.new
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
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "レシピを削除しました。"
    redirect_to recipes_path
  end

  def search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
    render 'public/recipes/index'
    # render 'public/recipes/search'
    # if user_signed_in?
    #   @recipes = @q.result(distinct: true).includes([:book_marks]).page(params[:page])
    # else
    #   @recipes = @q.result(distinct: true).includes([:user]).page(params[:page])
    # end
    @search = params[:q][:title_or_ingredients_content_cont]
  end

  private

    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :image, tag_ids: [],
        ingredients_attributes: [:id, :content, :quantity, :_destroy],
        procedures_attributes: [:id, :description, :_destroy])
    end

end
