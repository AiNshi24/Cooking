class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
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
  end

  def edit
  end
  
  private

    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :image, 
        ingredients_attributes: [:id, :content, :quantity, :_destroy],
        procedures_attributes: [:id, :description, :image, :_destroy])
    end
end
