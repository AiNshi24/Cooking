class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.order('id DESC').limit(3)
    # if user_signed_in?
    #   @recipes = @recipes.includes([:user], [:book_marks]).page(params[:page])
    # else
    #   @recipes = @recipes.includes([:user]).page(params[:page])
    # end
  end
end
