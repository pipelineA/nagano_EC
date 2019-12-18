class RemoveDefaultFromItemStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :item_status, from: 0, to: ""
  end
end
