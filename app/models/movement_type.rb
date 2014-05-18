class MovementType < ActiveRecord::Base

  has_many :movement

  validates_presence_of :title

end