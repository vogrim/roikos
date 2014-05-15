class BrandsController < ApplicationController

  before_filter :load_brand, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new brand_params
    if @brand.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @brand.update_attributes brand_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @brand.destroy
    redirect_to :action => "index"
  end

  private

  def brand_params
    params.require(:brand).permit(:title)
  end

  def load_brand
    @brand = Brand.find(params[:id])
  end

end