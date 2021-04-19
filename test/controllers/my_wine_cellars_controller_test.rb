require 'test_helper'

class MyWineCellarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_wine_cellar = my_wine_cellars(:one)
  end

  test "should get index" do
    get my_wine_cellars_url
    assert_response :success
  end

  test "should get new" do
    get new_my_wine_cellar_url
    assert_response :success
  end

  test "should create my_wine_cellar" do
    assert_difference('MyWineCellar.count') do
      post my_wine_cellars_url, params: { my_wine_cellar: { user_id: @my_wine_cellar.user_id, wine_cellar_id: @my_wine_cellar.wine_cellar_id } }
    end

    assert_redirected_to my_wine_cellar_url(MyWineCellar.last)
  end

  test "should show my_wine_cellar" do
    get my_wine_cellar_url(@my_wine_cellar)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_wine_cellar_url(@my_wine_cellar)
    assert_response :success
  end

  test "should update my_wine_cellar" do
    patch my_wine_cellar_url(@my_wine_cellar), params: { my_wine_cellar: { user_id: @my_wine_cellar.user_id, wine_cellar_id: @my_wine_cellar.wine_cellar_id } }
    assert_redirected_to my_wine_cellar_url(@my_wine_cellar)
  end

  test "should destroy my_wine_cellar" do
    assert_difference('MyWineCellar.count', -1) do
      delete my_wine_cellar_url(@my_wine_cellar)
    end

    assert_redirected_to my_wine_cellars_url
  end
end
