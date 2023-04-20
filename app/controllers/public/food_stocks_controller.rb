class Public::FoodStocksController < ApplicationController
 before_action :authenticate_user!, only: [:index, :create, :destroy]

  def create
    @food_stock = FoodStock.new(food_stock_params)
    @food_stock.user_id = current_user.id
    if @food_stock.save
      flash[:notice] = "食材を登録しました"
      redirect_to food_stocks_path
    else
      @food_stocks = current_user.food_stocks
      render :index
    end
  end

  def index
    @food_stocks = current_user.food_stocks
    @food_stock = FoodStock.new
  end

  def destroy
    @food_stock = FoodStock.find(params[:id]).destroy
    flash[:notice] = "食材を削除しました"
    redirect_to food_stocks_path
  end

  private

  def food_stock_params
    params.require(:food_stock).permit(:name, :memo, :user_id)
  end

end
