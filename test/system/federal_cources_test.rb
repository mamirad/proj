require "application_system_test_case"

class FederalCourcesTest < ApplicationSystemTestCase
  setup do
    @federal_cource = federal_cources(:one)
  end

  test "visiting the index" do
    visit federal_cources_url
    assert_selector "h1", text: "Federal Cources"
  end

  test "creating a Federal cource" do
    visit federal_cources_url
    click_on "New Federal Cource"

    fill_in "Cource name", with: @federal_cource.cource_name
    fill_in "Group", with: @federal_cource.group_id
    click_on "Create Federal cource"

    assert_text "Federal cource was successfully created"
    click_on "Back"
  end

  test "updating a Federal cource" do
    visit federal_cources_url
    click_on "Edit", match: :first

    fill_in "Cource name", with: @federal_cource.cource_name
    fill_in "Group", with: @federal_cource.group_id
    click_on "Update Federal cource"

    assert_text "Federal cource was successfully updated"
    click_on "Back"
  end

  test "destroying a Federal cource" do
    visit federal_cources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Federal cource was successfully destroyed"
  end
end
