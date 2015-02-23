class AddAccountReferences < ActiveRecord::Migration
  def change

    add_column :users, :account_id, :integer
    add_column :brands, :account_id, :integer
    add_column :clients, :account_id, :integer
    add_column :bills, :account_id, :integer
    add_column :movement_types, :account_id, :integer

  end
end