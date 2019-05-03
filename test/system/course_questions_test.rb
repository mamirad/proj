require "application_system_test_case"

class CourseQuestionsTest < ApplicationSystemTestCase
  setup do
    @course_question = course_questions(:one)
  end

  test "visiting the index" do
    visit course_questions_url
    assert_selector "h1", text: "Course Questions"
  end

  test "creating a Course question" do
    visit course_questions_url
    click_on "New Course Question"

    fill_in "Answer", with: @course_question.answer
    fill_in "Option1", with: @course_question.option1
    fill_in "Option2", with: @course_question.option2
    fill_in "Option3", with: @course_question.option3
    fill_in "Option4", with: @course_question.option4
    fill_in "Option5", with: @course_question.option5
    fill_in "Question", with: @course_question.question
    fill_in "Teachercourse", with: @course_question.teachercourse_id
    fill_in "Type", with: @course_question.type
    click_on "Create Course question"

    assert_text "Course question was successfully created"
    click_on "Back"
  end

  test "updating a Course question" do
    visit course_questions_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @course_question.answer
    fill_in "Option1", with: @course_question.option1
    fill_in "Option2", with: @course_question.option2
    fill_in "Option3", with: @course_question.option3
    fill_in "Option4", with: @course_question.option4
    fill_in "Option5", with: @course_question.option5
    fill_in "Question", with: @course_question.question
    fill_in "Teachercourse", with: @course_question.teachercourse_id
    fill_in "Type", with: @course_question.type
    click_on "Update Course question"

    assert_text "Course question was successfully updated"
    click_on "Back"
  end

  test "destroying a Course question" do
    visit course_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course question was successfully destroyed"
  end
end
