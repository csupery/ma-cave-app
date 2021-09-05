require 'test_helper'

class MyWineriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_winery = my_wineries(:one)
  end

  test "should get index" do
    get my_wineries_url
    assert_response :success
  end

  test "should get new" do
    get new_my_winery_url
    assert_response :success
  end

  test "should create my_winery" do
    assert_difference('MyWinery.count') do
      post my_wineries_url, params: { my_winery: { my_wine_cellar_id: @my_winery.my_wine_cellar_id, winery_id: @my_winery.winery_id } }
    end

    assert_redirected_to my_winery_url(MyWinery.last)
  end

  test "should show my_winery" do
    get my_winery_url(@my_winery)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_winery_url(@my_winery)
    assert_response :success
  end

  test "should update my_winery" do
    patch my_winery_url(@my_winery), params: { my_winery: { my_wine_cellar_id: @my_winery.my_wine_cellar_id, winery_id: @my_winery.winery_id } }
    assert_redirected_to my_winery_url(@my_winery)
  end

  test "should destroy my_winery" do
    assert_difference('MyWinery.count', -1) do
      delete my_winery_url(@my_winery)
    end

    assert_redirected_to my_wineries_url
  end
end
