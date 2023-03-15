require "test_helper"

class Public::FoodStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_food_stocks_new_url
    assert_response :success
  end

  test "should get index" do
    get public_food_stocks_index_url
    assert_response :success
  end
end
