class ClientProjectsController < ApplicationController

  before_filter :load_client_project, only: [:edit, :update, :destroy, :show]

  def index
    @client_projects = current_account.client_projects.all.paginate(:page => params[:page])
  end

  def new
    @client_project = current_account.client_projects.new
  end

  def create
    @client_project = current_account.client_projects.new client_project_params
    if @client_project.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @client_project.update_attributes client_project_params
      redirect_to client_path(@client_project.client)
    else
      render :action => "edit"
    end
  end

  def destroy
    @client_project.destroy
    redirect_to :back
  end

  private

  def client_project_params
    params.require(:client_project).permit(:title, :active, :_destroy)
  end

  def load_client_project
    @client_project = current_account.client_projects.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

end