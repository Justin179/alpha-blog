class AddSortIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sort_id, :integer
  end
end
