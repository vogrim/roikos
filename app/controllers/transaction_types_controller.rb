class TransactionTypesController < ApplicationController

  before_filter :load_transaction_type, only: [:edit, :update, :destroy]

  def index
    @transaction_types = TransactionType.all
  end

  def new
    @transaction_type = TransactionType.new
  end

  def create
    @transaction_type = TransactionType.new transaction_type_params
    if @transaction_type.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @transaction_type.update_attributes transaction_type_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @transaction_type.destroy
    redirect_to :action => "index"
  end

  private

  def transaction_type_params
    params.require(:transaction_type).permit(:title)
  end

  def load_transaction_type
    @transaction_type = TransactionType.find(params[:id])
  end

end