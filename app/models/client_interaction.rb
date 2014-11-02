class ClientInteraction < ActiveRecord::Base

  belongs_to :client

  before_create :fill_interaction_date

  validates_presence_of :client_id, :user_id

  default_scope { order('interaction_at DESC') }

  def is_scheduled_today
    Date.current == scheduled_at.to_date
  end

  protected

  def fill_interaction_date
    if interaction_at.blank? and scheduled_at.blank?
      self.interaction_at = Time.now if interaction_at.blank?
    end
  end

end