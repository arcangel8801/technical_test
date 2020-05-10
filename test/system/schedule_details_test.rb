require "application_system_test_case"

class ScheduleDetailsTest < ApplicationSystemTestCase
  setup do
    @schedule_detail = schedule_details(:one)
  end

  test "visiting the index" do
    visit schedule_details_url
    assert_selector "h1", text: "Schedule Details"
  end

  test "creating a Schedule detail" do
    visit schedule_details_url
    click_on "New Schedule Detail"

    fill_in "Coupons", with: @schedule_detail.coupons
    fill_in "Hour", with: @schedule_detail.hour
    fill_in "Schedule", with: @schedule_detail.schedule_id
    click_on "Create Schedule detail"

    assert_text "Schedule detail was successfully created"
    click_on "Back"
  end

  test "updating a Schedule detail" do
    visit schedule_details_url
    click_on "Edit", match: :first

    fill_in "Coupons", with: @schedule_detail.coupons
    fill_in "Hour", with: @schedule_detail.hour
    fill_in "Schedule", with: @schedule_detail.schedule_id
    click_on "Update Schedule detail"

    assert_text "Schedule detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule detail" do
    visit schedule_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule detail was successfully destroyed"
  end
end
