class Applicant < ApplicationRecord
  DOC_TYPES = %w[national_identity_card driving_licence passport voter_id work_permit].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :document_type, presence: true, inclusion: { in: DOC_TYPES }

  has_one_attached :document
end
