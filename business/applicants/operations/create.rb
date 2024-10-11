class Applicants::Operations::Create < Readymade::Operation
  def call
    build_record
    build_form
    sync_errors_to_record and return validation_fail unless form_valid?

    assign_attributes
    sync_errors_to_record and return validation_fail unless record_valid?

    save_record
    create_applicant
    upload_document
    binding.pry
    start_check if @applicant.present? && @document.present?
    save_applicant_id if @applicant.present?
    success(record: record)
  end

  private

  def build_record
    @record = Applicant.new
  end

  def form_class
    Applicants::Forms::Create
  end

  def onfido
    @onfido ||= OnfidoService.new
  end

  def create_applicant
    @applicant = onfido.create_applicant(first_name: record.first_name, last_name: record.last_name)
  end

  def upload_document
    tempfile_path = record_params.fetch(:document).tempfile
    @document = onfido.upload_document(record.document_type, @applicant.id, File.open(tempfile_path))
  end

  def start_check
    onfido.start_check(@applicant.id)
  end

  def save_applicant_id
    record.update!(onfido_applicant_id: @applicant.id)
  end
end
