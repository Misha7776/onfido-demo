class Applicants::Forms::Create < Readymade::Form
  PERMITTED_ATTRIBUTES = %i[first_name last_name document document_type].freeze
  REQUIRED_ATTRIBUTES = PERMITTED_ATTRIBUTES
end
