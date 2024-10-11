class CreateWebhookEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :webhook_events do |t|
      t.string :resource_type
      t.string :action
      t.json :object
      t.json :resource

      t.timestamps
    end
  end
end
