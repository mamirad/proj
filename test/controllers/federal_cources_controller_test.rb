require 'test_helper'

class FederalCourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @federal_cource = federal_cources(:one)
  end

  test "should get index" do
    get federal_cources_url
    assert_response :success
  end

  test "should get new" do
    get new_federal_cource_url
    assert_response :success
  end

  test "should create federal_cource" do
    assert_difference('FederalCource.count') do
      post federal_cources_url, params: { federal_cource: { cource_name: @federal_cource.cource_name, group_id: @federal_cource.group_id } }
    end

    assert_redirected_to federal_cource_url(FederalCource.last)
  end

  test "should show federal_cource" do
    get federal_cource_url(@federal_cource)
    assert_response :success
  end

  test "should get edit" do
    get edit_federal_cource_url(@federal_cource)
    assert_response :success
  end

  test "should update federal_cource" do
    patch federal_cource_url(@federal_cource), params: { federal_cource: { cource_name: @federal_cource.cource_name, group_id: @federal_cource.group_id } }
    assert_redirected_to federal_cource_url(@federal_cource)
  end

  test "should destroy federal_cource" do
    assert_difference('FederalCource.count', -1) do
      delete federal_cource_url(@federal_cource)
    end

    assert_redirected_to federal_cources_url
  end
end
