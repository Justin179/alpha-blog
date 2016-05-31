class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    # render plain: params[:product].inspect
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品新增成功!"
      redirect_to product_path(@product)
    else
      render 'new'
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :amount)
  end

end