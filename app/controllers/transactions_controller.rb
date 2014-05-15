class TransactionsController < ApplicationController

  before_filter :load_transaction, only: [:edit, :update, :destroy]
  before_filter :load_products

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new count: 1
  end

  def create
    @transaction = Transaction.new transaction_params
    if @transaction.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @transaction.update_attributes transaction_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @transaction.destroy
    redirect_to :action => "index"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_at, :count, :product_id, :note)
  end

  def load_transaction
    @transaction = Transaction.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

end