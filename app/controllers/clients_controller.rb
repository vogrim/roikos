class ClientsController < ApplicationController

  before_filter :load_client, only: [:edit, :update, :destroy, :show]

  def index
    @q = current_account.clients.search(params[:q])
    @clients = @q.result(distinct: true).paginate(:page => params[:page])
    redirect_to client_path(@clients.first) if @clients.length == 1
  end

  def show
  end

  def new
    @client = current_account.clients.new
  end

  def create
    @client = current_account.clients.new client_params
    if @client.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @client.update_attributes client_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @client.destroy
    redirect_to :action => "index"
  end

  private

  def client_params
    params.require(:client).permit(:company, :salutation, :title, :firstname, :surname, :email, :website, :phone, :fax, :street, :zipcode, :location, :country, :group, :avatar, comments_attributes: [:content])
  end

  def load_client
    @client = current_account.clients.find(params[:id])
  end

end