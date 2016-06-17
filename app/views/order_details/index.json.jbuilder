json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :id, :item, :price, :quantity, :subtotal, :totalamount, :order_id
  json.url order_detail_url(order_detail, format: :json)
end
