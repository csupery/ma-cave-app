require "application_system_test_case"

class MyWineriesTest < ApplicationSystemTestCase
  setup do
    @my_winery = my_wineries(:one)
  end

  test "visiting the index" do
    visit my_wineries_url
    assert_selector "h1", text: "My Wineries"
  end

  test "creating a My winery" do
    visit my_wineries_url
    click_on "New My Winery"

    fill_in "My wine cellar", with: @my_winery.my_wine_cellar_id
    fill_in "Winery", with: @my_winery.winery_id
    click_on "Create My winery"

    assert_text "My winery was successfully created"
    click_on "Back"
  end

  test "updating a My winery" do
    visit my_wineries_url
    click_on "Edit", match: :first

    fill_in "My wine cellar", with: @my_winery.my_wine_cellar_id
    fill_in "Winery", with: @my_winery.winery_id
    click_on "Update My winery"

    assert_text "My winery was successfully updated"
    click_on "Back"
  end

  test "destroying a My winery" do
    visit my_wineries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My winery was successfully destroyed"
  end
end
