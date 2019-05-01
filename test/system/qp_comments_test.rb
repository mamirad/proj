require "application_system_test_case"

class QpCommentsTest < ApplicationSystemTestCase
  setup do
    @qp_comment = qp_comments(:one)
  end

  test "visiting the index" do
    visit qp_comments_url
    assert_selector "h1", text: "Qp Comments"
  end

  test "creating a Qp comment" do
    visit qp_comments_url
    click_on "New Qp Comment"

    fill_in "Comment", with: @qp_comment.comment
    fill_in "Question paper", with: @qp_comment.question_paper_id
    check "Status" if @qp_comment.status
    click_on "Create Qp comment"

    assert_text "Qp comment was successfully created"
    click_on "Back"
  end

  test "updating a Qp comment" do
    visit qp_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @qp_comment.comment
    fill_in "Question paper", with: @qp_comment.question_paper_id
    check "Status" if @qp_comment.status
    click_on "Update Qp comment"

    assert_text "Qp comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Qp comment" do
    visit qp_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qp comment was successfully destroyed"
  end
end
