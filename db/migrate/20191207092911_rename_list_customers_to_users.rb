class RenameListCustomersToUsers < ActiveRecord::Migration[5.2]
	def change
    rename_table :customers, :users #この行を追加！
  end
end
