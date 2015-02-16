class Account < ActiveRecord::Base

  has_many :users
  has_many :brands
  has_many :clients
  has_many :bills

end