class ClientInteractionsController < ApplicationController

  before_filter :load_client_interaction, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]
  before_filter :load_users, only: [:new, :edit]

  def index
    @client_interactions = current_account.client_interactions.includes(:client).all.paginate(:page => params[:page])
  end

  def new
    @client_interaction = current_account.client_interactions.new params[:client_interaction] ? client_interaction_params : {}
  end

  def create
    @client_interaction = current_account.client_interactions.new client_interaction_params
    if @client_interaction.save
      redirect_to client_path(@client_interaction.client)
    else
      render :action => "new"
    end
  end

  def update
    if @client_interaction.update_attributes client_interaction_params
      redirect_to client_path(@client_interaction.client)
    else
      render :action => "edit"
    end
  end

  def destroy
    @client_interaction.destroy
    redirect_to :back
  end

  def shift_scheduled_time

    shift = params[:shift].to_i

    @client_interaction = current_account.client_interactions.find(params[:id])
    @client_interaction.scheduled_at = @client_interaction.scheduled_at + shift
    @client_interaction.save

    render :nothing => true
  end

  private

  def client_interaction_params
    params.require(:client_interaction).permit(:scheduled_at, :interaction_at, :client_id, :user_id, :method, :note, :_destroy)
  end

  def load_client_interaction
    @client_interaction = current_account.client_interactions.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

  def load_users
    @users = current_account.users.all
  end

end