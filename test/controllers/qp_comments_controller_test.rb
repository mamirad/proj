require 'test_helper'

class QpCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qp_comment = qp_comments(:one)
  end

  test "should get index" do
    get qp_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_qp_comment_url
    assert_response :success
  end

  test "should create qp_comment" do
    assert_difference('QpComment.count') do
      post qp_comments_url, params: { qp_comment: { comment: @qp_comment.comment, question_paper_id: @qp_comment.question_paper_id, status: @qp_comment.status } }
    end

    assert_redirected_to qp_comment_url(QpComment.last)
  end

  test "should show qp_comment" do
    get qp_comment_url(@qp_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_qp_comment_url(@qp_comment)
    assert_response :success
  end

  test "should update qp_comment" do
    patch qp_comment_url(@qp_comment), params: { qp_comment: { comment: @qp_comment.comment, question_paper_id: @qp_comment.question_paper_id, status: @qp_comment.status } }
    assert_redirected_to qp_comment_url(@qp_comment)
  end

  test "should destroy qp_comment" do
    assert_difference('QpComment.count', -1) do
      delete qp_comment_url(@qp_comment)
    end

    assert_redirected_to qp_comments_url
  end
end
