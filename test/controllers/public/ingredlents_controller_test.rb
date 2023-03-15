require "test_helper"

class Public::IngredlentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_ingredlents_new_url
    assert_response :success
  end

  test "should get index" do
    get public_ingredlents_index_url
    assert_response :success
  end
end
