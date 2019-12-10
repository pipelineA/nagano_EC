class Item < ApplicationRecord
	has_many :order_items
	has_many :cart_items
	belongs_to :genre
	attachment :image
	def tax_include_price
		(price * 1.1).floor()
	end
end