class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :author, :string, :after => :title
    add_column :products, :isbn_13, :string, :after => :shortcut
  end
end
