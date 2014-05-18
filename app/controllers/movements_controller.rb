class MovementsController < ApplicationController

  before_filter :load_movement, only: [:edit, :update, :destroy]
  before_filter :load_products

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
    params.require(:movement).permit(:movement_at, :count, :product_id, :note)
  end

  def load_movement
    @movement = Movement.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

end