require 'test_helper'

class CriticalLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @critical_level = critical_levels(:one)
  end

  test "should get index" do
    get critical_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_critical_level_url
    assert_response :success
  end

  test "should create critical_level" do
    assert_difference('CriticalLevel.count') do
      post critical_levels_url, params: { critical_level: { frecuency: @critical_level.frecuency, name: @critical_level.name } }
    end

    assert_redirected_to critical_level_url(CriticalLevel.last)
  end

  test "should show critical_level" do
    get critical_level_url(@critical_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_critical_level_url(@critical_level)
    assert_response :success
  end

  test "should update critical_level" do
    patch critical_level_url(@critical_level), params: { critical_level: { frecuency: @critical_level.frecuency, name: @critical_level.name } }
    assert_redirected_to critical_level_url(@critical_level)
  end

  test "should destroy critical_level" do
    assert_difference('CriticalLevel.count', -1) do
      delete critical_level_url(@critical_level)
    end

    assert_redirected_to critical_levels_url
  end
end
