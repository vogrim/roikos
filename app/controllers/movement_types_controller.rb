class MovementTypesController < ApplicationController

  before_filter :load_movement_type, only: [:edit, :update, :destroy]

  def index
    @movement_types = MovementType.all
  end

  def new
    @movement_type = MovementType.new
  end

  def create
    @movement_type = MovementType.new movement_type_params
    if @movement_type.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @movement_type.update_attributes movement_type_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @movement_type.destroy
    redirect_to :action => "index"
  end

  private

  def movement_type_params
    params.require(:movement_type).permit(:title, :increase_state)
  end

  def load_movement_type
    @movement_type = MovementType.find(params[:id])
  end

end