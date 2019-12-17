class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :user
	validates :item_count, presence: true
end