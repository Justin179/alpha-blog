class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :phone
      t.string :address
      t.string :opentime
      t.string :closetime
      t.integer :user_id
      t.timestamps null: false
    end
  end
end