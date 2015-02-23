class ProductsController < ApplicationController

  before_filter :load_product, only: [:edit, :update, :destroy]
  before_filter :load_brands

  def index
    @products = current_account.products
  end

  def new
    @product = current_account.products.new
  end

  def create
    @product = current_account.products.new product_params
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
    @product = current_account.products.find(params[:id])
  end

  def load_brands
    @brands = current_account.brands.all
  end

end