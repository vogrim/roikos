class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|

      t.references :client

      t.date :sent_at
      t.date :payed_at

      t.string :label

      t.string :shipping_label
      t.integer :shipping_price

      t.string :note

      t.timestamps
    end
  end
end
