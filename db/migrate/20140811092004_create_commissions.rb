class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.date :start_at
      t.date :end_at
      t.references :client
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end