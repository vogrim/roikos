class EventsController < ApplicationController

  before_filter :load_event, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new params[:event] ? event_params : {}
  end

  def create
    @event = Event.new event_params
    if @event.save
      @event.create_interaction current_user.id
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @event.update_attributes event_params
      @event.create_interaction current_user.id
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
    params.require(:event).permit(:event_at, :agreed_at, :client_id, :audience_count, :audience_age_class, :note)
  end

  def load_event
    @event = Event.find(params[:id])
  end

  def load_clients
    @clients = Client.all
  end

end