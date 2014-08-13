class Event < ActiveRecord::Base

  belongs_to :client

  default_scope { order('event_at DESC') }

end