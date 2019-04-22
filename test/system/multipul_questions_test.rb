require "application_system_test_case"

class MultipulQuestionsTest < ApplicationSystemTestCase
  setup do
    @multipul_question = multipul_questions(:one)
  end

  test "visiting the index" do
    visit multipul_questions_url
    assert_selector "h1", text: "Multipul Questions"
  end

  test "creating a Multipul question" do
    visit multipul_questions_url
    click_on "New Multipul Question"

    fill_in "Option1", with: @multipul_question.option1
    fill_in "Option2", with: @multipul_question.option2
    fill_in "Option3", with: @multipul_question.option3
    fill_in "Option4", with: @multipul_question.option4
    fill_in "Option5", with: @multipul_question.option5
    fill_in "Option6", with: @multipul_question.option6
    fill_in "Question", with: @multipul_question.question
    fill_in "Teachercourse", with: @multipul_question.teachercourse_id
    click_on "Create Multipul question"

    assert_text "Multipul question was successfully created"
    click_on "Back"
  end

  test "updating a Multipul question" do
    visit multipul_questions_url
    click_on "Edit", match: :first

    fill_in "Option1", with: @multipul_question.option1
    fill_in "Option2", with: @multipul_question.option2
    fill_in "Option3", with: @multipul_question.option3
    fill_in "Option4", with: @multipul_question.option4
    fill_in "Option5", with: @multipul_question.option5
    fill_in "Option6", with: @multipul_question.option6
    fill_in "Question", with: @multipul_question.question
    fill_in "Teachercourse", with: @multipul_question.teachercourse_id
    click_on "Update Multipul question"

    assert_text "Multipul question was successfully updated"
    click_on "Back"
  end

  test "destroying a Multipul question" do
    visit multipul_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Multipul question was successfully destroyed"
  end
end
