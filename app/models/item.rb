class Item < ApplicationRecord
	has_many :order_items
	has_many :cart_items
	belongs_to :genre
	attachment :image
	enum item_status: { 販売中: 0, 販売y停止中: 1 }
	def tax_include_price
		(price * (1 + 0.1)).round()
	end
end