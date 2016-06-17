class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :item
      t.float :price
      t.integer :quantity
      t.float :subtotal
      t.float :totalamount
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
