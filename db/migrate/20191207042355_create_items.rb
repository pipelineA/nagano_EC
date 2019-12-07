class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false, default: ""
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.text :image_id, null: false, default: ""
      t.integer :item_status, null: false, default: 0
      t.integer :price, null: false, default: ""

      t.timestamps
    end
  end
end
