class User < ActiveRecord::Base
  
  ROLES = ["admin", "superuser", "user"]

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  # Todo 
  # validates_inclusion_of :role, in: -> (u) { ROLES[ROLES.index(u.role_was)..-1] }
  
  has_many :comments

  belongs_to :account
  
  def accessible_roles
    ROLES[ROLES.index(self.role)..-1]
  end
  
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