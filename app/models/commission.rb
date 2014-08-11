class Commission < ActiveRecord::Base

  belongs_to :client

  has_many :commission_items
  has_many :products, through: :commission_items

  alias_method :items, :commission_items

  accepts_nested_attributes_for :commission_items, allow_destroy: true

end