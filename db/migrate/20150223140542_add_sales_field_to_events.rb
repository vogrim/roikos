class AddSalesFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sales, :integer, default: 0
  end
end
