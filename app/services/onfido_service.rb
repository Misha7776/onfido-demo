class OnfidoService
  def initialize
    @onfido = Onfido::DefaultApi.new
  end

  def create_applicant(options = {})
    options = options.with_defaults("location": { "country_of_residence": "GBR" })
    @onfido.create_applicant(Onfido::ApplicantBuilder.new(options))
  rescue Onfido::ApiError => e
    puts e.message       # => 'Unprocessable entity'
    puts e.response_body # => { error: { type: "validation_error", message: "", fields: { "email": [ "invalid format" ] } } }
    puts e.code          # => '422'
  end

  def upload_document(doc_type, applicant_id, file, opts = {})
    @onfido.upload_document(doc_type, applicant_id, file, opts)
  rescue Onfido::ApiError => e
    puts e.message
    puts e.response_body
    puts e.code
  end

  def create_webhook(options = {})
    params = options.with_defaults(url: "#{ENV.fetch('BASE_URL')}/webhooks",
                                   events: %w[report.completed check.completed],
                                   enabled: true, environments: [ "sandbox" ])
    @onfido.create_webhook(Onfido::WebhookBuilder.new(params))
  rescue Onfido::ApiError => e
    puts e.message
    puts e.response_body
    puts e.code
  end

  def start_check(applicant_id, report_names = [Onfido::ReportName::DOCUMENT])
    @onfido.create_check(Onfido::CheckBuilder.new({ applicant_id:, report_names: }))
  rescue Onfido::ApiError => e
    puts e.message
    puts e.response_body
    puts e.code
  end
end
