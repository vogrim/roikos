class Account < ActiveRecord::Base
 
  has_many :users
  has_many :brands
  has_many :clients
  has_many :bills
  has_many :movement_types
  has_many :client_projects
 
  has_many :products, through: :brands
  has_many :client_interactions, through: :clients
  has_many :events, through: :clients
  has_many :commissions, through: :clients
  has_many :movements, through: :products
 
end