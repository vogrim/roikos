class EventsController < ApplicationController

  before_filter :load_event, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]

  def index
    @events = current_account.events.all
  end

  def new
    @event = current_account.events.new params[:event] ? event_params : {}
  end

  def create
    @event = current_account.events.new event_params
    if @event.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @event.update_attributes event_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to :action => "index"
  end

  private

  def event_params
    params.require(:event).permit(:event_at, :agreed_at, :client_id, :audience_count, :audience_age_class, :sales, :note)
  end

  def load_event
    @event = current_account.events.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

end