class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.order('id DESC').limit(3)
  end
end
