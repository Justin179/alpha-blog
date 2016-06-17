class SortsController < ApplicationController

  before_action :set_sort, only: [:edit, :update, :show, :destroy]

  def new
    @sort = Sort.new
  end

  def create
    @sort = Sort.new(sort_params)
    if @sort.save
      flash[:success] = "已儲存商品類別"
      redirect_to sorts_path
    else
      render 'new'
    end
  end

  def edit
    #@sort = Sort.find(params[:id])
  end

  def update
    #@sort = Sort.find(params[:id])
    if @sort.update(sort_params)
      flash[:success] = "類別更新成功!"
      redirect_to sorts_path
    else
      render 'edit'
    end
  end

  def index
    @sorts = Sort.all
  end

  def show
    #@sort = Sort.find(params[:id])
    @sort_products = @sort.products
  end



  def destroy
    #@sort = Sort.find(params[:id])
    @sort.destroy
    flash[:danger] = "類別刪除成功"
    redirect_to sorts_path
  end

  private
  def sort_params
     params.require(:sort).permit(:name)
  end
  def set_sort
     @sort = Sort.find(params[:id])
  end
end
