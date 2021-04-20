require "application_system_test_case"

class MyWineCellarsTest < ApplicationSystemTestCase
  setup do
    @my_wine_cellar = my_wine_cellars(:one)
  end

  test "visiting the index" do
    visit my_wine_cellars_url
    assert_selector "h1", text: "My Wine Cellars"
  end

  test "creating a My wine cellar" do
    visit my_wine_cellars_url
    click_on "New My Wine Cellar"

    fill_in "User", with: @my_wine_cellar.user_id
    fill_in "Wine cellar", with: @my_wine_cellar.wine_cellar_id
    click_on "Create My wine cellar"

    assert_text "My wine cellar was successfully created"
    click_on "Back"
  end

  test "updating a My wine cellar" do
    visit my_wine_cellars_url
    click_on "Edit", match: :first

    fill_in "User", with: @my_wine_cellar.user_id
    fill_in "Wine cellar", with: @my_wine_cellar.wine_cellar_id
    click_on "Update My wine cellar"

    assert_text "My wine cellar was successfully updated"
    click_on "Back"
  end

  test "destroying a My wine cellar" do
    visit my_wine_cellars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My wine cellar was successfully destroyed"
  end
end
