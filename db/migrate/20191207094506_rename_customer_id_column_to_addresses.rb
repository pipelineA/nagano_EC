class RenameCustomerIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :customer_id, :user_id
  end
end
