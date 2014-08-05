class MovementsController < ApplicationController

  before_filter :load_movement, :load_clients, only: [:edit, :update, :destroy]
  before_filter :load_products, :load_movement_types

  def index
    @movements = Movement.all
  end

  def new
    @movement = Movement.new count: 1
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
    params.require(:movement).permit(:movement_at, :count, :product_id, :movement_type_id, :client_id, :note)
  end

  def load_movement
    @movement = Movement.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

  def load_movement_types
    @movement_types = MovementType.all
  end

  def load_clients
    @clients = Client.all
  end

end