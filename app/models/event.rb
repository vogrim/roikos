class Event < ActiveRecord::Base

  belongs_to :client

  default_scope { order('event_at DESC') }

  def is_in_future
    Date.today.to_s < event_at
  end

  def create_interaction(user_id)
    newInteraction = ClientInteraction.new
    newInteraction.client_id = client_id
    newInteraction.user_id = user_id
    newInteraction.scheduled_at = 6.weekdays_from(event_at)
    newInteraction.method = "Anruf"
    newInteraction.note = "Fragen wie viel Bestellungen es durch Vorlesungen gegeben hat."
    newInteraction.save
  end

  def sellrate
    sales * 100 / audience_count
  end

end