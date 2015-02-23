class Client < ActiveRecord::Base

  has_many :comments, :as => :commentable
  has_many :movements
  has_many :commissions
  has_many :events
  has_many :bills
  has_many :bill_items, through: :bills
  has_many :client_interactions

  belongs_to :account

  accepts_nested_attributes_for :comments

  mount_uploader :avatar, AvatarUploader

  default_scope { order('created_at DESC') }

  scope :search_fullname_and_company, -> (q) {
    words = q.split " "
    words_sql = words.map {|w| "%#{w}%"}
    query = ["concat(company, firstname, surname) LIKE ?"] * words.size
    where(query.join(" and "), *words_sql)
  }

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
    bill_items.sum :quantity
  end

end