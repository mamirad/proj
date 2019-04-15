require "application_system_test_case"

class AdminteachersTest < ApplicationSystemTestCase
  setup do
    @adminteacher = adminteachers(:one)
  end

  test "visiting the index" do
    visit adminteachers_url
    assert_selector "h1", text: "Adminteachers"
  end

  test "creating a Adminteacher" do
    visit adminteachers_url
    click_on "New Adminteacher"

    fill_in "Federal cource", with: @adminteacher.federal_cource_id
    fill_in "Teacher name", with: @adminteacher.teacher_name
    click_on "Create Adminteacher"

    assert_text "Adminteacher was successfully created"
    click_on "Back"
  end

  test "updating a Adminteacher" do
    visit adminteachers_url
    click_on "Edit", match: :first

    fill_in "Federal cource", with: @adminteacher.federal_cource_id
    fill_in "Teacher name", with: @adminteacher.teacher_name
    click_on "Update Adminteacher"

    assert_text "Adminteacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Adminteacher" do
    visit adminteachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adminteacher was successfully destroyed"
  end
end
