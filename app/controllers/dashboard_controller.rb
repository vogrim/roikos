class DashboardController < ApplicationController

  # before_action :authenticate_user!

  def index

    @future_client_interactions = current_account.client_interactions.includes(:client).where("scheduled_at > ? AND interaction_at is NULL", 0).order('scheduled_at ASC')

  end

end