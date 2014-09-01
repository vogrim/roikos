class CreateClientInteractions < ActiveRecord::Migration
  def change
    create_table :client_interactions do |t|
      t.datetime :scheduled_at
      t.datetime :interaction_at
      t.references :client
      t.references :user
      t.string :method
      t.string :note
      t.timestamps
    end
  end
end
