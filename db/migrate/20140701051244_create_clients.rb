class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company
      t.string :salutation
      t.string :title
      t.string :firstname
      t.string :surname
      t.string :email
      t.string :phone, :limit => 30
      t.string :fax, :limit => 30
      t.string :street
      t.string :zipcode, :limit => 15
      t.string :location
      t.string :country
      t.string :group
      t.timestamps
    end
  end
end
