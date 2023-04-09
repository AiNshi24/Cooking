class Admin::CommentsController < ApplicationController
 
  def destroy
    @comment = Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    redirect_to admin_recipe_path(params[:recipe_id])
    flash[:notice] = "コメントを削除しました。"
  end
  
end
