class AddAccountReferenceToClientProjects < ActiveRecord::Migration
  def change

    add_column :client_projects, :statuses, :text
    add_column :client_projects, :account_id, :integer

  end
end