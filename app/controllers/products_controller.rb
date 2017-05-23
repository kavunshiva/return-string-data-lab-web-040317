class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory.present? && product.inventory > 0 ? "true" : "false"
  end

  def create
    @product = Product.new(product_params(
      :name,
      :price,
      :description,
      :inventory
    ))
    if @product.save()
      redirect_to products_path
    else
      render :new
    end
  end

  def product_params(*args)
    params.require(:product).permit(*args)
  end
end
