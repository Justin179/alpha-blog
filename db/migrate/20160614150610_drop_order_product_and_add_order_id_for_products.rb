class DropOrderProductAndAddOrderIdForProducts < ActiveRecord::Migration
  def change
    add_column :products, :order_id, :integer
    drop_table :order_products
  end
end
