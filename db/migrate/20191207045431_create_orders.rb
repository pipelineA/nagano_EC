class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :fee, null: false, default: 800
      t.integer :payment_method, null: false
      t.float :tax_rate, null: false, default: 0.1
      t.integer :order_status, null: false, default: 0
      t.string :ordered_reveiver_name, null: false, default: ""
      t.integer :ordered_postal_code, null: false
      t.string :ordered_address, null: false, default: ""
      t.integer :billing_amount, null: false
      t.timestamps
    end
  end
end
