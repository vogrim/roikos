class Movement < ActiveRecord::Base

  belongs_to :product
  belongs_to :movement_type

  validates_presence_of :movement_at, :count, :product_id

  default_scope { order('movement_at DESC') }

  attr_accessor :account

  validates_inclusion_of :product, in: -> (movement) { movement.account.products }

end