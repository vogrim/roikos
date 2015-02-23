class Brand < ActiveRecord::Base

  has_many :products

  belongs_to :account

  validates_presence_of :title

end