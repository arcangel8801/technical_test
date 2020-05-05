require 'test_helper'

class ScheduleDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_detail = schedule_details(:one)
  end

  test "should get index" do
    get schedule_details_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_detail_url
    assert_response :success
  end

  test "should create schedule_detail" do
    assert_difference('ScheduleDetail.count') do
      post schedule_details_url, params: { schedule_detail: { coupons: @schedule_detail.coupons, hour: @schedule_detail.hour, minute: @schedule_detail.minute, schedule_id: @schedule_detail.schedule_id } }
    end

    assert_redirected_to schedule_detail_url(ScheduleDetail.last)
  end

  test "should show schedule_detail" do
    get schedule_detail_url(@schedule_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_detail_url(@schedule_detail)
    assert_response :success
  end

  test "should update schedule_detail" do
    patch schedule_detail_url(@schedule_detail), params: { schedule_detail: { coupons: @schedule_detail.coupons, hour: @schedule_detail.hour, minute: @schedule_detail.minute, schedule_id: @schedule_detail.schedule_id } }
    assert_redirected_to schedule_detail_url(@schedule_detail)
  end

  test "should destroy schedule_detail" do
    assert_difference('ScheduleDetail.count', -1) do
      delete schedule_detail_url(@schedule_detail)
    end

    assert_redirected_to schedule_details_url
  end
end
