class ChangeDefaultOfIsMainActive < ActiveRecord::Migration[5.2]
  def change
    change_column_default :addresses, :is_main_active, from: false, to: true
    rename_column :addresses, :is_main_active, :is_main_address
  end
end
