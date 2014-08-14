class ChangeFieldForBills < ActiveRecord::Migration
  def change
    change_column :bills, :shipping_price, :float
  end
end
