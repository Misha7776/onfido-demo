require 'onfido'

Onfido.configure do |config|
  config.api_token = RCreds.fetch(:onfido, :api_token)
  config.region = config.region[:EU]
  config.timeout = 30
end
