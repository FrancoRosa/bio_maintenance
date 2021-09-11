require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "creating a Device" do
    visit devices_url
    click_on "New Device"

    fill_in "Area", with: @device.area_id
    fill_in "Brand", with: @device.brand
    fill_in "Critical level", with: @device.critical_level_id
    fill_in "Device type", with: @device.device_type_id
    fill_in "Last maintenance", with: @device.last_maintenance
    fill_in "Model", with: @device.model
    fill_in "Name", with: @device.name
    fill_in "Serial", with: @device.serial
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "updating a Device" do
    visit devices_url
    click_on "Edit", match: :first

    fill_in "Area", with: @device.area_id
    fill_in "Brand", with: @device.brand
    fill_in "Critical level", with: @device.critical_level_id
    fill_in "Device type", with: @device.device_type_id
    fill_in "Last maintenance", with: @device.last_maintenance
    fill_in "Model", with: @device.model
    fill_in "Name", with: @device.name
    fill_in "Serial", with: @device.serial
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "destroying a Device" do
    visit devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device was successfully destroyed"
  end
end
