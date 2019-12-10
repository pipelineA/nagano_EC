class RenameOrderedReveiverName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :ordered_reveiver_name, :ordered_receiver_name
  end
end
