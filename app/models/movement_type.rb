class MovementType < ActiveRecord::Base

  has_many :movement

  belongs_to :account

  validates_presence_of :title

end