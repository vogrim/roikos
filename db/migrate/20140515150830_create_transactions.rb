class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :transaction_at
      t.integer :count
      t.references :product
      t.string :note
      t.timestamps
    end
  end
end
