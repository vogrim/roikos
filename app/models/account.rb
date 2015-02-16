class Account < ActiveRecord::Base

  has_many :users
  has_many :brands
  has_many :clients
  has_many :bills

  has_many :products, through: :brands

end