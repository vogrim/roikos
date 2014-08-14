class ProductsController < ApplicationController

  before_filter :load_product, only: [:edit, :update, :destroy]
  before_filter :load_brands

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @product.update_attributes product_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to :action => "index"
  end

  private

  def product_params
    params.require(:product).permit(:title, :shortcut, :brand_id, :isbn_13, :author)
  end

  def load_product
    @product = Product.find(params[:id])
  end

  def load_brands
    @brands = Brand.all
  end

end