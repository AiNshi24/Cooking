require "test_helper"

class Admin::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_recipes_edit_url
    assert_response :success
  end
end
