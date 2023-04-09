class Admin::HomesController < ApplicationController
  def top
    @recipes = Recipe.page(params[:page])
  end
  
end
