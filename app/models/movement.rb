class Movement < ActiveRecord::Base

  belongs_to :product
  belongs_to :movement_type

  validates_presence_of :movement_at, :count, :product_id

end