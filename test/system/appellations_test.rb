require "application_system_test_case"

class AppellationsTest < ApplicationSystemTestCase
  setup do
    @appellation = appellations(:one)
  end

  test "visiting the index" do
    visit appellations_url
    assert_selector "h1", text: "Appellations"
  end

  test "creating a Appellation" do
    visit appellations_url
    click_on "New Appellation"

    fill_in "Location", with: @appellation.location
    fill_in "Name", with: @appellation.name
    fill_in "Winery", with: @appellation.winery_id
    click_on "Create Appellation"

    assert_text "Appellation was successfully created"
    click_on "Back"
  end

  test "updating a Appellation" do
    visit appellations_url
    click_on "Edit", match: :first

    fill_in "Location", with: @appellation.location
    fill_in "Name", with: @appellation.name
    fill_in "Winery", with: @appellation.winery_id
    click_on "Update Appellation"

    assert_text "Appellation was successfully updated"
    click_on "Back"
  end

  test "destroying a Appellation" do
    visit appellations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appellation was successfully destroyed"
  end
end
