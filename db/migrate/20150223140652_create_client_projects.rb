class CreateClientProjects < ActiveRecord::Migration
  def change
    create_table :client_projects do |t|
      t.string :title
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
