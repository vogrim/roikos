class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :shortcut
      t.references :brand
      t.timestamps
    end
  end
end
