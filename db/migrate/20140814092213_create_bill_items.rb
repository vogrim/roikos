class CreateBillItems < ActiveRecord::Migration
  def change
    create_table :bill_items do |t|
      t.references :bill, :product
      t.text :label
      t.integer :tax
      t.float :unit_price
      t.integer :quantity
      t.timestamps
    end
  end
end
