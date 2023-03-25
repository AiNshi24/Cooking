class Public::CommentsController < ApplicationController
  def index
  end
  
  def create
    recipe = Recipe.find(params[:id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = recipe.id
    if comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to recipe_path(@recipe.id)
    else
      redirect_to recipe_path(@recipe.id)
    end
  end
  
   private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id)
  end
  
end
