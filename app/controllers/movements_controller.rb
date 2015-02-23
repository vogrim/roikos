class MovementsController < ApplicationController

  before_filter :load_movement, only: [:edit, :update, :destroy]
  before_filter :load_products, :load_movement_types
  before_filter :load_clients, only: [:new, :edit]

  def index
    @movements = current_account.movements.all
  end

  def new
    @movement = Movement.new params[:movement] ? movement_params : {count: 1}
  end

  def create
    @movement = Movement.new movement_params
    if @movement.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @movement.update_attributes movement_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @movement.destroy
    redirect_to :action => "index"
  end

  private

  def movement_params
    params.require(:movement).permit(:movement_at, :count, :product_id, :movement_type_id, :client_id, :note).merge account: current_account
  end

  def load_movement
    @movement = current_account.movements.find(params[:id])
  end

  def load_products
    @products = current_account.products.all
  end

  def load_movement_types
    @movement_types = current_account.movement_types.all
  end

  def load_clients
    @clients = current_account.clients.all
  end

end