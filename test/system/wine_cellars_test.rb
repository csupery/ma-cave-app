require "application_system_test_case"

class WineCellarsTest < ApplicationSystemTestCase
  setup do
    @wine_cellar = wine_cellars(:one)
  end

  test "visiting the index" do
    visit wine_cellars_url
    assert_selector "h1", text: "Wine Cellars"
  end

  test "creating a Wine cellar" do
    visit wine_cellars_url
    click_on "New Wine Cellar"

    fill_in "Name", with: @wine_cellar.name
    fill_in "Token", with: @wine_cellar.token
    click_on "Create Wine cellar"

    assert_text "Wine cellar was successfully created"
    click_on "Back"
  end

  test "updating a Wine cellar" do
    visit wine_cellars_url
    click_on "Edit", match: :first

    fill_in "Name", with: @wine_cellar.name
    fill_in "Token", with: @wine_cellar.token
    click_on "Update Wine cellar"

    assert_text "Wine cellar was successfully updated"
    click_on "Back"
  end

  test "destroying a Wine cellar" do
    visit wine_cellars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wine cellar was successfully destroyed"
  end
end
