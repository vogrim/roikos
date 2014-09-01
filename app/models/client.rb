class Client < ActiveRecord::Base

  has_many :comments, :as => :commentable
  has_many :movements
  has_many :commissions
  has_many :events
  has_many :bills
  has_many :client_interactions

  accepts_nested_attributes_for :comments

  mount_uploader :avatar, AvatarUploader

  def title_for_list
    [company, full_name].reject(&:blank?).join(', ')
  end

  def main_title_for_detail
    company.empty? ? full_name : company
  end

  def sub_title_for_detail
    company.empty? ? "" : full_name
  end

  def full_name
    [salutation, title, firstname, surname].compact.join(' ')
  end

  def full_address
    [street, zipcode, location, country_string].compact.join(' ')
  end

  def country_string
    Country[country]
  end

  def total_product_sales
    total_sales = 0
    for bill in bills do
      for bill_item in bill.bill_items do
        total_sales += bill_item.quantity
      end
    end
    total_sales
  end

end