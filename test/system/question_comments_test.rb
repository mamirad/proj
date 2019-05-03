require "application_system_test_case"

class QuestionCommentsTest < ApplicationSystemTestCase
  setup do
    @question_comment = question_comments(:one)
  end

  test "visiting the index" do
    visit question_comments_url
    assert_selector "h1", text: "Question Comments"
  end

  test "creating a Question comment" do
    visit question_comments_url
    click_on "New Question Comment"

    fill_in "Comment", with: @question_comment.comment
    fill_in "Course question", with: @question_comment.course_question_id
    check "Status" if @question_comment.status
    fill_in "User", with: @question_comment.user_id
    click_on "Create Question comment"

    assert_text "Question comment was successfully created"
    click_on "Back"
  end

  test "updating a Question comment" do
    visit question_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @question_comment.comment
    fill_in "Course question", with: @question_comment.course_question_id
    check "Status" if @question_comment.status
    fill_in "User", with: @question_comment.user_id
    click_on "Update Question comment"

    assert_text "Question comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Question comment" do
    visit question_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question comment was successfully destroyed"
  end
end
