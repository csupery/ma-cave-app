require 'test_helper'

class AppellationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appellation = appellations(:one)
  end

  test "should get index" do
    get appellations_url
    assert_response :success
  end

  test "should get new" do
    get new_appellation_url
    assert_response :success
  end

  test "should create appellation" do
    assert_difference('Appellation.count') do
      post appellations_url, params: { appellation: { location: @appellation.location, name: @appellation.name, winery_id: @appellation.winery_id } }
    end

    assert_redirected_to appellation_url(Appellation.last)
  end

  test "should show appellation" do
    get appellation_url(@appellation)
    assert_response :success
  end

  test "should get edit" do
    get edit_appellation_url(@appellation)
    assert_response :success
  end

  test "should update appellation" do
    patch appellation_url(@appellation), params: { appellation: { location: @appellation.location, name: @appellation.name, winery_id: @appellation.winery_id } }
    assert_redirected_to appellation_url(@appellation)
  end

  test "should destroy appellation" do
    assert_difference('Appellation.count', -1) do
      delete appellation_url(@appellation)
    end

    assert_redirected_to appellations_url
  end
end
