class DashboardController < ApplicationController

  # before_action :authenticate_user!

  def index

    @future_client_interactions = ClientInteraction.where("scheduled_at > ? AND interaction_at is NULL", 0).order('scheduled_at ASC')

  end

end