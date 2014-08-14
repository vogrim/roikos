class BillsController < ApplicationController

  before_filter :load_Bill, only: [:edit, :update, :destroy]
  before_filter :load_clients, only: [:new, :edit]

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
    @bill.bill_items.build
  end

  def edit
    @bill.bill_items.build tax: 10
  end

  def create
    @bill = Bill.new bill_params
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

  def load_Bill
    @bill = Bill.find(params[:id])
  end

  def load_clients
    @clients = Client.all
  end

end