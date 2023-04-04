class Public::FoodStocksController < ApplicationController
  
  def create
    @food_stock = FoodStock.new(food_stock_params)
    @food_stock.user_id = current_user.id
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
    @food_stock = FoodStock.find_by(id: params[:id], user_id: params[:user_id]).destroy
    flash[:notice] = "食材を削除しました"
    redirect_to user_food_stocks_path
  end
  
  private
  
  def food_stock_params
    params.require(:food_stock).permit(:name, :memo)
  end
  
end
