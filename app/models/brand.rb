class Brand < ActiveRecord::Base

  has_many :products

  validates_presence_of :title

end