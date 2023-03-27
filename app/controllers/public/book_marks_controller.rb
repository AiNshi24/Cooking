class Public::BookMarksController < ApplicationController
  def index
  end
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.book_marks.new(recipe_id: recipe.id)
    bookmark.save
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.book_marks.find_by(recipe_id: recipe.id)
    bookmark.destroy
    redirect_to recipe_path(params[:recipe_id])
  end
  
end
