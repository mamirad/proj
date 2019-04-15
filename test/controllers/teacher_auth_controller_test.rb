require 'test_helper'

class TeacherAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get teacher_auth_home_url
    assert_response :success
  end

end
