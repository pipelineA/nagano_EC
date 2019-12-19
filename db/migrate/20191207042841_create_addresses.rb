class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

    t.integer :customer_id, null: false
    t.string :postal_code, null: false, default: ""
    t.string :address, null: false, default: ""
    t.string :receiver_name, null: false, default: ""
    t.boolean :is_main_active, null: false, default: false
	t.timestamps
    end
  end
end