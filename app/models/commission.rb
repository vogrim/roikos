class Commission < ActiveRecord::Base

  belongs_to :client

  has_many :commission_items
  has_many :products, through: :commission_items

  alias_method :items, :commission_items

  accepts_nested_attributes_for :commission_items, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? && attributes['project_id'].blank? }

  default_scope { order('start_at DESC') }

  validates_presence_of :start_at, :end_at, :client_id

end
