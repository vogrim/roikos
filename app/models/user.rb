class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_many :comments

  belongs_to :account

  def full_name
    "#{firstname} #{surname}"
  end

end