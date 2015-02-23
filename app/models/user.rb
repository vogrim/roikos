class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :comments

  belongs_to :account
  
  def full_name
    "#{firstname} #{surname}"
  end
  
  def admin?
    has_role? "admin"
  end
  
  def user?
    has_role? "user"
  end
  
  def superuser?
    has_role? "superuser"
  end
  
  private
  
  def has_role?(role)
    self.role == role
  end

end