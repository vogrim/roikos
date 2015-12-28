  class ClientProjectItemsController < ApplicationController

  before_filter :load_client_project_item, only: [:edit, :update, :destroy]
  before_filter :load_client_projects, only: [:new, :edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]

  def index
    @client_project = current_account.client_projects.find(params[:client_project_id])
    @client_project_items = @client_project.client_project_items.includes(:client).all.paginate(:page => params[:page])
  end

  def new
    @client_project = current_account.client_projects.find(params[:client_project_id])
    @client_project_item = @client_project.client_project_items.new
  end
 
  def create
    @client_project = current_account.client_projects.find(params[:client_project_id])
    @client_project_item = @client_project.client_project_items.new client_project_item_params
    if @client_project_item.save
      redirect_to client_project_path(@client_project)
    else
      render :action => "new"
    end
  end

  def update
    if @client_project_item.update_attributes client_project_item_params
      redirect_to client_project_path(@client_project_item.client_project)
    else
      render :action => "edit"
    end
  end

  def destroy
    @client_project_item.destroy
    redirect_to :back
  end

  private

  def client_project_item_params
    params.require(:client_project_item).permit(:client_project_id, :client_id, :note, :status, :_destroy)
  end

  def load_client_project_item
    @client_project = current_account.client_projects.find(params[:client_project_id])
    @client_project_item = @client_project.client_project_items.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

  def load_client_projects
    @client_projects = current_account.client_projects.all
  end

end