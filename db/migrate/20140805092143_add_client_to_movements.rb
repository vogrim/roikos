class AddClientToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :client, :after => :movement_type_id
  end
end
