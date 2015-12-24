class AddAccountReferenceToClientProjects < ActiveRecord::Migration
  def change

    add_column :client_projects, :account_id, :integer

  end
end