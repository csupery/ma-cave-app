require 'test_helper'

class AppellationWineriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appellation_winery = appellation_wineries(:one)
  end

  test "should get index" do
    get appellation_wineries_url
    assert_response :success
  end

  test "should get new" do
    get new_appellation_winery_url
    assert_response :success
  end

  test "should create appellation_winery" do
    assert_difference('AppellationWinery.count') do
      post appellation_wineries_url, params: { appellation_winery: { appellation_id: @appellation_winery.appellation_id, winery_id: @appellation_winery.winery_id } }
    end

    assert_redirected_to appellation_winery_url(AppellationWinery.last)
  end

  test "should show appellation_winery" do
    get appellation_winery_url(@appellation_winery)
    assert_response :success
  end

  test "should get edit" do
    get edit_appellation_winery_url(@appellation_winery)
    assert_response :success
  end

  test "should update appellation_winery" do
    patch appellation_winery_url(@appellation_winery), params: { appellation_winery: { appellation_id: @appellation_winery.appellation_id, winery_id: @appellation_winery.winery_id } }
    assert_redirected_to appellation_winery_url(@appellation_winery)
  end

  test "should destroy appellation_winery" do
    assert_difference('AppellationWinery.count', -1) do
      delete appellation_winery_url(@appellation_winery)
    end

    assert_redirected_to appellation_wineries_url
  end
end
