json.extract! webhook_event, :id, :created_at, :updated_at
json.url webhook_event_url(webhook_event, format: :json)
