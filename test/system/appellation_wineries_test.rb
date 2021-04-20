require "application_system_test_case"

class AppellationWineriesTest < ApplicationSystemTestCase
  setup do
    @appellation_winery = appellation_wineries(:one)
  end

  test "visiting the index" do
    visit appellation_wineries_url
    assert_selector "h1", text: "Appellation Wineries"
  end

  test "creating a Appellation winery" do
    visit appellation_wineries_url
    click_on "New Appellation Winery"

    fill_in "Appellation", with: @appellation_winery.appellation_id
    fill_in "Winery", with: @appellation_winery.winery_id
    click_on "Create Appellation winery"

    assert_text "Appellation winery was successfully created"
    click_on "Back"
  end

  test "updating a Appellation winery" do
    visit appellation_wineries_url
    click_on "Edit", match: :first

    fill_in "Appellation", with: @appellation_winery.appellation_id
    fill_in "Winery", with: @appellation_winery.winery_id
    click_on "Update Appellation winery"

    assert_text "Appellation winery was successfully updated"
    click_on "Back"
  end

  test "destroying a Appellation winery" do
    visit appellation_wineries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appellation winery was successfully destroyed"
  end
end
