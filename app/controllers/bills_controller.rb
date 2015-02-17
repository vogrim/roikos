class BillsController < ApplicationController

  before_filter :load_bill, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]
  before_filter :load_products, only: [:new, :edit]

  def index
    @bills = current_account.bills.all
  end

  def new
    @bill = current_account.bills.new params[:bill] ? bill_params : {}
    @bill.bill_items.build
  end

  def edit
    @bill.bill_items.build tax: 10
  end

  def create
    @bill = current_account.bills.new bill_params
    if @bill.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @bill.update_attributes bill_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @bill.destroy
    redirect_to :action => "index"
  end

  private

  def bill_params
    params.require(:bill).permit(:sent_at, :payed_at, :client_id, :label, :shipping_label, :shipping_price, :note, bill_items_attributes: [:id, :product_id, :label, :tax, :unit_price, :quantity, :_destroy])
  end

  def load_bill
    @bill = current_account.bills.find(params[:id])
  end

  def load_clients
    @clients = current_account.clients.all
  end

  def load_products
    @products = current_account.products.all
  end

end