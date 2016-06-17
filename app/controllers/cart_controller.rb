class CartController < ApplicationController
  # 不管使用者有無登入都有session，cart是一個存放在session裡面的字典{}, 內存放產品的id與數量

  def add
    # 在產品頁點下add to cart，傳來產品id & 使用者id
    u_id = params[:uId]
    p_id = params[:pId]

    # session中找cart有則用，沒有則建 (if the cart has been created, use the existing cart else create a new cart)
    if session[:cart] # {"1"=>4}
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    # 加入此訂單的主人
    #cart[:uId] = u_id

    # cart is a dictionary, 裡面有放很多products
    # (if the product has been added to the cart, increment the value else set the value 1)
    if cart[p_id] # {"23"=>9, "24"=>1, "25"=>1, "26"=>1}
      cart[p_id] = cart[p_id] + 1
    else
      cart[p_id] = 1
    end

    # 導頁到 cart index
    redirect_to :action => :index
  end

  def index
    # if there is a cart, pass it to the page for display else pass an empty value
    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def clearCart
    # 找到購物車物件，清空它
    session[:cart] = nil
    # 導頁到 cart index
    redirect_to :action => :index
  end
end
