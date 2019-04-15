require 'test_helper'

class PunjabCourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @punjab_cource = punjab_cources(:one)
  end

  test "should get index" do
    get punjab_cources_url
    assert_response :success
  end

  test "should get new" do
    get new_punjab_cource_url
    assert_response :success
  end

  test "should create punjab_cource" do
    assert_difference('PunjabCource.count') do
      post punjab_cources_url, params: { punjab_cource: { cource_name: @punjab_cource.cource_name, group_id: @punjab_cource.group_id } }
    end

    assert_redirected_to punjab_cource_url(PunjabCource.last)
  end

  test "should show punjab_cource" do
    get punjab_cource_url(@punjab_cource)
    assert_response :success
  end

  test "should get edit" do
    get edit_punjab_cource_url(@punjab_cource)
    assert_response :success
  end

  test "should update punjab_cource" do
    patch punjab_cource_url(@punjab_cource), params: { punjab_cource: { cource_name: @punjab_cource.cource_name, group_id: @punjab_cource.group_id } }
    assert_redirected_to punjab_cource_url(@punjab_cource)
  end

  test "should destroy punjab_cource" do
    assert_difference('PunjabCource.count', -1) do
      delete punjab_cource_url(@punjab_cource)
    end

    assert_redirected_to punjab_cources_url
  end
end
