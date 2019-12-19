class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false, default: ""
      t.text :description, null: false
      t.text :image_id, null: false
      t.integer :item_status, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
