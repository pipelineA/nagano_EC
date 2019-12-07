class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false, default: ""
      t.integer :order_id, null: false, default: ""
      t.integer :making_status, null: false, default: 0
      t.integer :item_count, null: false, default: ""
      t.integer :ordered_price, null: false, default: ""
      t.string :ordered_item_name, null: false, default: ""

      t.timestamps
    end
  end
end
