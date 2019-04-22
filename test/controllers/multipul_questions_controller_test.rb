require 'test_helper'

class MultipulQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multipul_question = multipul_questions(:one)
  end

  test "should get index" do
    get multipul_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_multipul_question_url
    assert_response :success
  end

  test "should create multipul_question" do
    assert_difference('MultipulQuestion.count') do
      post multipul_questions_url, params: { multipul_question: { option1: @multipul_question.option1, option2: @multipul_question.option2, option3: @multipul_question.option3, option4: @multipul_question.option4, option5: @multipul_question.option5, option6: @multipul_question.option6, question: @multipul_question.question, teachercourse_id: @multipul_question.teachercourse_id } }
    end

    assert_redirected_to multipul_question_url(MultipulQuestion.last)
  end

  test "should show multipul_question" do
    get multipul_question_url(@multipul_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_multipul_question_url(@multipul_question)
    assert_response :success
  end

  test "should update multipul_question" do
    patch multipul_question_url(@multipul_question), params: { multipul_question: { option1: @multipul_question.option1, option2: @multipul_question.option2, option3: @multipul_question.option3, option4: @multipul_question.option4, option5: @multipul_question.option5, option6: @multipul_question.option6, question: @multipul_question.question, teachercourse_id: @multipul_question.teachercourse_id } }
    assert_redirected_to multipul_question_url(@multipul_question)
  end

  test "should destroy multipul_question" do
    assert_difference('MultipulQuestion.count', -1) do
      delete multipul_question_url(@multipul_question)
    end

    assert_redirected_to multipul_questions_url
  end
end
