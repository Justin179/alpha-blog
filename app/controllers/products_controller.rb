class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
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

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品更新成功!"
      redirect_to product_path(@product)
    else
      render 'edit'
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:danger] = "商品刪除成功"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :amount)
  end

end