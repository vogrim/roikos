class InsertClientWebsiteColumn < ActiveRecord::Migration
  def change
    add_column :clients, :website, :string, :after => :email
  end
end