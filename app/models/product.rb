class Product < ActiveRecord::Base

  belongs_to :brand
  has_many :transactions

  validates_presence_of :title, :brand_id

end