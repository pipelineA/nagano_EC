class ChangeOrderedPostalCodeFromIntegerToString < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :ordered_postal_code, :string
  end
  
  def down
    change_column :orders, :ordered_postal_code, :integer
  end
end
