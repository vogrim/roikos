class CommissionItem < ActiveRecord::Base

  belongs_to :commission
  belongs_to :product

  validates_presence_of :product_id, :quantity

end