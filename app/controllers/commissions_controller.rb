class CommissionsController < ApplicationController

  before_filter :load_commission, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]
  before_filter :load_products, only: [:new, :edit]

  def index
    @commissions = current_account.commissions.all
  end

  def new
    @commission = current_account.commissions.new params[:commission] ? commission_params : {}
    @commission.commission_items.build
  end

  def edit
    @commission.commission_items.build
  end

  def create
    @commission = current_account.commissions.new commission_params
    if @commission.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @commission.update_attributes commission_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @commission.destroy
    redirect_to :action => "index"
  end

  private

  def commission_params
    params.require(:commission).permit(:start_at, :end_at, :client_id, :active, commission_items_attributes: [:id, :quantity, :product_id, :_destroy])
  end

  def load_commission
    @commission = current_account.commissions.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

  def load_products
    @products = current_account.products.all
  end

end