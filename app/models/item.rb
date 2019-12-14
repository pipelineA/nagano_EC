class Item < ApplicationRecord
	has_many :order_items
	has_many :cart_items
	belongs_to :genre
	attachment :image
	enum item_status: { 販売中: 0, 販売停止中: 1 }

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :description, presence: true, length: { maximum: 400 }
  validates :image_id, presence: true
  validates :price, presence: true

	def tax_include_price
		(price * (1 + 0.1)).round()
	end
end