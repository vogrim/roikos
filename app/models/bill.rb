class Bill < ActiveRecord::Base

  belongs_to :client
  belongs_to :account

  has_many :bill_items
  has_many :products, through: :bill_items

  alias_method :items, :bill_items

  accepts_nested_attributes_for :bill_items, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? && attributes['project_id'].blank? }

  default_scope { order('sent_at DESC') }

  # validates_inclusion_of :client, in: -> (bill) { bill.account.clients }

  def is_payed
    ! payed_at.nil?
  end

end