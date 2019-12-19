class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :making_status, null: false, default: 0
      t.integer :item_count, null: false
      t.integer :ordered_price, null: false
      t.string :ordered_item_name, null: false, default: ""

      t.timestamps
    end
  end
end
