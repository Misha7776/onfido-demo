class CreateApplicants < ActiveRecord::Migration[7.2]
  def change
    create_table :applicants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :document_type
      t.string :onfido_applicant_id

      t.timestamps
    end
  end
end
