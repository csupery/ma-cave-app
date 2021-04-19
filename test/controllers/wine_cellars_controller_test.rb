require 'test_helper'

class WineCellarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine_cellar = wine_cellars(:one)
  end

  test "should get index" do
    get wine_cellars_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_cellar_url
    assert_response :success
  end

  test "should create wine_cellar" do
    assert_difference('WineCellar.count') do
      post wine_cellars_url, params: { wine_cellar: { name: @wine_cellar.name, token: @wine_cellar.token } }
    end

    assert_redirected_to wine_cellar_url(WineCellar.last)
  end

  test "should show wine_cellar" do
    get wine_cellar_url(@wine_cellar)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_cellar_url(@wine_cellar)
    assert_response :success
  end

  test "should update wine_cellar" do
    patch wine_cellar_url(@wine_cellar), params: { wine_cellar: { name: @wine_cellar.name, token: @wine_cellar.token } }
    assert_redirected_to wine_cellar_url(@wine_cellar)
  end

  test "should destroy wine_cellar" do
    assert_difference('WineCellar.count', -1) do
      delete wine_cellar_url(@wine_cellar)
    end

    assert_redirected_to wine_cellars_url
  end
end
