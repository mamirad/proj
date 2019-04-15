require "application_system_test_case"

class PunjabCourcesTest < ApplicationSystemTestCase
  setup do
    @punjab_cource = punjab_cources(:one)
  end

  test "visiting the index" do
    visit punjab_cources_url
    assert_selector "h1", text: "Punjab Cources"
  end

  test "creating a Punjab cource" do
    visit punjab_cources_url
    click_on "New Punjab Cource"

    fill_in "Cource name", with: @punjab_cource.cource_name
    fill_in "Group", with: @punjab_cource.group_id
    click_on "Create Punjab cource"

    assert_text "Punjab cource was successfully created"
    click_on "Back"
  end

  test "updating a Punjab cource" do
    visit punjab_cources_url
    click_on "Edit", match: :first

    fill_in "Cource name", with: @punjab_cource.cource_name
    fill_in "Group", with: @punjab_cource.group_id
    click_on "Update Punjab cource"

    assert_text "Punjab cource was successfully updated"
    click_on "Back"
  end

  test "destroying a Punjab cource" do
    visit punjab_cources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Punjab cource was successfully destroyed"
  end
end
