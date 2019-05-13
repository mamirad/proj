require 'test_helper'

class QquizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qquiz = qquizzes(:one)
  end

  test "should get index" do
    get qquizzes_url
    assert_response :success
  end

  test "should get new" do
    get new_qquiz_url
    assert_response :success
  end

  test "should create qquiz" do
    assert_difference('Qquiz.count') do
      post qquizzes_url, params: { qquiz: { expire_date: @qquiz.expire_date, teachercourse_id: @qquiz.teachercourse_id } }
    end

    assert_redirected_to qquiz_url(Qquiz.last)
  end

  test "should show qquiz" do
    get qquiz_url(@qquiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_qquiz_url(@qquiz)
    assert_response :success
  end

  test "should update qquiz" do
    patch qquiz_url(@qquiz), params: { qquiz: { expire_date: @qquiz.expire_date, teachercourse_id: @qquiz.teachercourse_id } }
    assert_redirected_to qquiz_url(@qquiz)
  end

  test "should destroy qquiz" do
    assert_difference('Qquiz.count', -1) do
      delete qquiz_url(@qquiz)
    end

    assert_redirected_to qquizzes_url
  end
end
