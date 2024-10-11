require "application_system_test_case"

class WebhookEventsTest < ApplicationSystemTestCase
  setup do
    @webhook_event = webhook_events(:one)
  end

  test "visiting the index" do
    visit webhook_events_url
    assert_selector "h1", text: "Webhook events"
  end

  test "should create webhook event" do
    visit webhook_events_url
    click_on "New webhook event"

    click_on "Create Webhook event"

    assert_text "Webhook event was successfully created"
    click_on "Back"
  end

  test "should update Webhook event" do
    visit webhook_event_url(@webhook_event)
    click_on "Edit this webhook event", match: :first

    click_on "Update Webhook event"

    assert_text "Webhook event was successfully updated"
    click_on "Back"
  end

  test "should destroy Webhook event" do
    visit webhook_event_url(@webhook_event)
    click_on "Destroy this webhook event", match: :first

    assert_text "Webhook event was successfully destroyed"
  end
end
