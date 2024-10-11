class WebhooksController < ApplicationController
  def create
    verifier = Onfido::WebhookEventVerifier.new(RCreds.fetch(:onfido, :webhook_token))

    signature = request.headers["X-SHA2-Signature"]

    event = verifier.read_payload(params, signature)
    WebhookEvent.create!(resource_type: event.resource_type,
                        action: event.action,
                        object: event.object,
                        resource: event.resource)

    head :ok
  rescue Onfido::OnfidoInvalidSignatureError => e
    e.type
    e.fields
    e.response_code
    head :unauthorized
  end
end
