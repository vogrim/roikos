class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_at
      t.date :agreed_at
      t.references :client
      t.integer :audience_count
      t.string :audience_age_class
      t.string :note
      t.timestamps
    end
  end
end
