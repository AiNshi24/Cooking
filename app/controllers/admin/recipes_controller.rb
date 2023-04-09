class Admin::RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "レシピを削除しました。"
    redirect_to admin_path
  end
  
end
