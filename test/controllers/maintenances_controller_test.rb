require 'test_helper'

class MaintenancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance = maintenances(:one)
  end

  test "should get index" do
    get maintenances_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_url
    assert_response :success
  end

  test "should create maintenance" do
    assert_difference('Maintenance.count') do
      post maintenances_url, params: { maintenance: { activities: @maintenance.activities, device_id: @maintenance.device_id, diagnostic: @maintenance.diagnostic, maintainer_id: @maintenance.maintainer_id, maintenance_type: @maintenance.maintenance_type, observations: @maintenance.observations, parts: @maintenance.parts, state_after: @maintenance.state_after, state_before: @maintenance.state_before } }
    end

    assert_redirected_to maintenance_url(Maintenance.last)
  end

  test "should show maintenance" do
    get maintenance_url(@maintenance)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_url(@maintenance)
    assert_response :success
  end

  test "should update maintenance" do
    patch maintenance_url(@maintenance), params: { maintenance: { activities: @maintenance.activities, device_id: @maintenance.device_id, diagnostic: @maintenance.diagnostic, maintainer_id: @maintenance.maintainer_id, maintenance_type: @maintenance.maintenance_type, observations: @maintenance.observations, parts: @maintenance.parts, state_after: @maintenance.state_after, state_before: @maintenance.state_before } }
    assert_redirected_to maintenance_url(@maintenance)
  end

  test "should destroy maintenance" do
    assert_difference('Maintenance.count', -1) do
      delete maintenance_url(@maintenance)
    end

    assert_redirected_to maintenances_url
  end
end
