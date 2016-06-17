class OrdersController < ApplicationController

  def new
    # @order = Order.new
    # @cart = params[:cId]
    # @cart2 = session[:cart]
  end

  def create
    cart = session[:cart]
    
  end

end
