class BillItem < ActiveRecord::Base

  belongs_to :bill
  belongs_to :product

  validates_presence_of :product_id, :quantity

  before_save :fill_label


  protected

  def fill_label
    self.label = default_label if label.empty?
  end

  def default_label
    "#{product.title}\n#{product.author} (ISBN-13: #{product.isbn_13})"
  end

end