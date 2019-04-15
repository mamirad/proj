require 'test_helper'

class AdminteachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminteacher = adminteachers(:one)
  end

  test "should get index" do
    get adminteachers_url
    assert_response :success
  end

  test "should get new" do
    get new_adminteacher_url
    assert_response :success
  end

  test "should create adminteacher" do
    assert_difference('Adminteacher.count') do
      post adminteachers_url, params: { adminteacher: { federal_cource_id: @adminteacher.federal_cource_id, teacher_name: @adminteacher.teacher_name } }
    end

    assert_redirected_to adminteacher_url(Adminteacher.last)
  end

  test "should show adminteacher" do
    get adminteacher_url(@adminteacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminteacher_url(@adminteacher)
    assert_response :success
  end

  test "should update adminteacher" do
    patch adminteacher_url(@adminteacher), params: { adminteacher: { federal_cource_id: @adminteacher.federal_cource_id, teacher_name: @adminteacher.teacher_name } }
    assert_redirected_to adminteacher_url(@adminteacher)
  end

  test "should destroy adminteacher" do
    assert_difference('Adminteacher.count', -1) do
      delete adminteacher_url(@adminteacher)
    end

    assert_redirected_to adminteachers_url
  end
end
