class OrdersController < ApplicationController

  def new
    # @order = Order.new
    # @cart = params[:cId]
    # @cart2 = session[:cart]
  end

  def create

    cart = session[:cart] # {"23"=>35, "24"=>11, "25"=>2, "26"=>1, "uId"=>"8", "total"=>2160.0}

    total_amount = cart["total"].to_f # 取total
    # user = User.find(cart["uId"].to_i) # 取uId
    order = Order.new(user: current_user)

    # 已取出，可刪掉
    # cart.delete("total")
    # cart.delete("uId")

    if order.save

      cart.each do | p_id, quantity |
        if (p_id != "uId" && p_id != "total")
          order_details = OrderDetail.new(order: order)
          product = Product.find_by_id(p_id)
          #<item: nil, price: nil, quantity: nil, subtotal: nil, totalamount: nil>
          order_details.item = product.name
          order_details.price = product.price
          order_details.quantity = quantity
          order_details.subtotal = product.price * quantity
          order_details.totalamount = total_amount
          order_details.save
        end
      end

      #  order GET    /orders/:id(.:format)             orders#show
      flash[:success] = "訂單新增成功"
      redirect_to order_path(order)

    else
      flash[:danger] = "新增訂單失敗!"
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
    # order.order_details
  end

end
