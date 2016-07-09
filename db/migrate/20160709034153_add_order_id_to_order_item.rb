class AddOrderIdToOrderItem < ActiveRecord::Migration
  def change
      add_column :order_items, :order_id, :integer
      add_index :order_items, :order_id
      #add_foreign_key :order_items, :order_id
  end
end
