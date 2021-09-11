require "application_system_test_case"

class CriticalLevelsTest < ApplicationSystemTestCase
  setup do
    @critical_level = critical_levels(:one)
  end

  test "visiting the index" do
    visit critical_levels_url
    assert_selector "h1", text: "Critical Levels"
  end

  test "creating a Critical level" do
    visit critical_levels_url
    click_on "New Critical Level"

    fill_in "Frecuency", with: @critical_level.frecuency
    fill_in "Name", with: @critical_level.name
    click_on "Create Critical level"

    assert_text "Critical level was successfully created"
    click_on "Back"
  end

  test "updating a Critical level" do
    visit critical_levels_url
    click_on "Edit", match: :first

    fill_in "Frecuency", with: @critical_level.frecuency
    fill_in "Name", with: @critical_level.name
    click_on "Update Critical level"

    assert_text "Critical level was successfully updated"
    click_on "Back"
  end

  test "destroying a Critical level" do
    visit critical_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Critical level was successfully destroyed"
  end
end
