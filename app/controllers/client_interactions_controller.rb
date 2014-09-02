class ClientInteractionsController < ApplicationController

  before_filter :load_client_interaction, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]
  before_filter :load_users, only: [:new, :edit]

  def index
    @client_interactions = ClientInteraction.all
  end

  def new
    @client_interaction = ClientInteraction.new
  end

  def create
    @client_interaction = ClientInteraction.new client_interaction_params
    if @client_interaction.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @client_interaction.update_attributes client_interaction_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @client_interaction.destroy
    redirect_to :action => "index"
  end

  private

  def client_interaction_params
    params.require(:client_interaction).permit(:scheduled_at, :interaction_at, :client_id, :user_id, :method, :note, :_destroy)
  end

  def load_client_interaction
    @client_interaction = ClientInteraction.find(params[:id])
  end

  def load_clients
    @clients = Client.all
  end

  def load_users
    @users = User.all
  end

end