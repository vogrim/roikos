class CreateCommissionItems < ActiveRecord::Migration
  def change
    create_table :commission_items do |t|
      t.references :commission, :product
      t.integer :quantity
      t.timestamps
    end
  end
end
