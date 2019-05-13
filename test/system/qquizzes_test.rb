require "application_system_test_case"

class QquizzesTest < ApplicationSystemTestCase
  setup do
    @qquiz = qquizzes(:one)
  end

  test "visiting the index" do
    visit qquizzes_url
    assert_selector "h1", text: "Qquizzes"
  end

  test "creating a Qquiz" do
    visit qquizzes_url
    click_on "New Qquiz"

    fill_in "Expire date", with: @qquiz.expire_date
    fill_in "Teachercourse", with: @qquiz.teachercourse_id
    click_on "Create Qquiz"

    assert_text "Qquiz was successfully created"
    click_on "Back"
  end

  test "updating a Qquiz" do
    visit qquizzes_url
    click_on "Edit", match: :first

    fill_in "Expire date", with: @qquiz.expire_date
    fill_in "Teachercourse", with: @qquiz.teachercourse_id
    click_on "Update Qquiz"

    assert_text "Qquiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Qquiz" do
    visit qquizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qquiz was successfully destroyed"
  end
end
