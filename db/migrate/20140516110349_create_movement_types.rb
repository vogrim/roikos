class CreateMovementTypes < ActiveRecord::Migration
  def change
    create_table :movement_types do |t|
      t.string :title
      t.boolean :increase_state, :default => false
      t.timestamps
    end
  end
end