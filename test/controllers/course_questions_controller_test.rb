require 'test_helper'

class CourseQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_question = course_questions(:one)
  end

  test "should get index" do
    get course_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_course_question_url
    assert_response :success
  end

  test "should create course_question" do
    assert_difference('CourseQuestion.count') do
      post course_questions_url, params: { course_question: { answer: @course_question.answer, option1: @course_question.option1, option2: @course_question.option2, option3: @course_question.option3, option4: @course_question.option4, option5: @course_question.option5, question: @course_question.question, teachercourse_id: @course_question.teachercourse_id, type: @course_question.type } }
    end

    assert_redirected_to course_question_url(CourseQuestion.last)
  end

  test "should show course_question" do
    get course_question_url(@course_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_question_url(@course_question)
    assert_response :success
  end

  test "should update course_question" do
    patch course_question_url(@course_question), params: { course_question: { answer: @course_question.answer, option1: @course_question.option1, option2: @course_question.option2, option3: @course_question.option3, option4: @course_question.option4, option5: @course_question.option5, question: @course_question.question, teachercourse_id: @course_question.teachercourse_id, type: @course_question.type } }
    assert_redirected_to course_question_url(@course_question)
  end

  test "should destroy course_question" do
    assert_difference('CourseQuestion.count', -1) do
      delete course_question_url(@course_question)
    end

    assert_redirected_to course_questions_url
  end
end
