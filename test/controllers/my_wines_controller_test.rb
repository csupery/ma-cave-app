require 'test_helper'

class MyWinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_wine = my_wines(:one)
  end

  test "should get index" do
    get my_wines_url
    assert_response :success
  end

  test "should get new" do
    get new_my_wine_url
    assert_response :success
  end

  test "should create my_wine" do
    assert_difference('MyWine.count') do
      post my_wines_url, params: { my_wine: { description: @my_wine.description, wine_cellar_id: @my_wine.wine_cellar_id, wine_id: @my_wine.wine_id } }
    end

    assert_redirected_to my_wine_url(MyWine.last)
  end

  test "should show my_wine" do
    get my_wine_url(@my_wine)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_wine_url(@my_wine)
    assert_response :success
  end

  test "should update my_wine" do
    patch my_wine_url(@my_wine), params: { my_wine: { description: @my_wine.description, wine_cellar_id: @my_wine.wine_cellar_id, wine_id: @my_wine.wine_id } }
    assert_redirected_to my_wine_url(@my_wine)
  end

  test "should destroy my_wine" do
    assert_difference('MyWine.count', -1) do
      delete my_wine_url(@my_wine)
    end

    assert_redirected_to my_wines_url
  end
end
