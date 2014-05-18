class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.date :movement_at
      t.integer :count
      t.references :product
      t.string :note
      t.timestamps
    end
  end
end
