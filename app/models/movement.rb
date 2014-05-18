class Movement < ActiveRecord::Base

  belongs_to :product

  validates_presence_of :movement_at, :count, :product_id

end