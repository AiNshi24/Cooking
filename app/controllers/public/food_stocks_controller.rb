class Public::FoodStocksController < ApplicationController
  before_action :is_matching_login_user, only: [:create, :index]
  
  def create
    @food_stock = FoodStock.new(food_stock_params)
    if @food_stock.save
      flash[:notice] = "食材を登録しました"
      redirect_to user_food_stocks_path
    else
      @food_stocks = FoodStock.all
      render :index
    end
  end

  def index
    @food_stocks = FoodStock.all
    @food_stock = FoodStock.new
  end
  
  def destroy
    @food_stock = FoodStock.find(params[:id])
    @food_stock.destroy
    flash[:notice] = "食材を削除しました"
    redirect_to user_food_stocks_path
  end
  
  private
  
  def food_stock_params
    params.require(:food_stock).permit(:name, :memo)
  end
  
  # アクセス制限
  def is_matching_login_user
    @food_stock = FoodStock.find(params[:id])
    unless @food_stock.user == current_user
      redirect_to root_path
    end
  end
  
end
