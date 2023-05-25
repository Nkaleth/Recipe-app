require "test_helper"

class RecipeFoodControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipe_food_new_url
    assert_response :success
  end

  test "should get create" do
    get recipe_food_create_url
    assert_response :success
  end

  test "should get edit" do
    get recipe_food_edit_url
    assert_response :success
  end

  test "should get update" do
    get recipe_food_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recipe_food_destroy_url
    assert_response :success
  end
end
