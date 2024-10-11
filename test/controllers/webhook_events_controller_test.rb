require "test_helper"

class WebhookEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webhook_event = webhook_events(:one)
  end

  test "should get index" do
    get webhook_events_url
    assert_response :success
  end

  test "should get new" do
    get new_webhook_event_url
    assert_response :success
  end

  test "should create webhook_event" do
    assert_difference("WebhookEvent.count") do
      post webhook_events_url, params: { webhook_event: {} }
    end

    assert_redirected_to webhook_event_url(WebhookEvent.last)
  end

  test "should show webhook_event" do
    get webhook_event_url(@webhook_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_webhook_event_url(@webhook_event)
    assert_response :success
  end

  test "should update webhook_event" do
    patch webhook_event_url(@webhook_event), params: { webhook_event: {} }
    assert_redirected_to webhook_event_url(@webhook_event)
  end

  test "should destroy webhook_event" do
    assert_difference("WebhookEvent.count", -1) do
      delete webhook_event_url(@webhook_event)
    end

    assert_redirected_to webhook_events_url
  end
end
