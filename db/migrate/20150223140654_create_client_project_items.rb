class CreateClientProjectItems < ActiveRecord::Migration
  def change
    create_table :client_project_items do |t|
      t.references :client
      t.references :client_project
      t.string :status
      t.text :note
      t.timestamps
    end
  end
end
