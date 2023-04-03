class Public::CommentsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = recipe.id
    if comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to recipe_path(params[:recipe_id])
    else
      redirect_to recipe_path(params[:recipe_id])
    end
  end
  
  def destroy
    comment = Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    redirect_to comment.recipe
    flash[:notice] = "コメントを削除しました。"
  end
  
   private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id, :image)
  end
  
end
