class ClientProject < ActiveRecord::Base

  validates_presence_of :title

  default_scope { order('created_at DESC') }

end