class Client < ActiveRecord::Base

  has_many :comments, :as => :commentable

  accepts_nested_attributes_for :comments

  mount_uploader :avatar, AvatarUploader

  def title_for_list
    [company, full_name].reject(&:blank?).join(', ')
  end

  def full_name
    [salutation, title, firstname, surname].compact.join(' ')
  end

end