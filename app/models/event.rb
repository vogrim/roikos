class Event < ActiveRecord::Base

  belongs_to :client

  default_scope { order('event_at DESC') }

  def is_in_future
    Date.today.to_s < event_at
  end

end