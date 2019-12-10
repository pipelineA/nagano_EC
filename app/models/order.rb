class Order < ApplicationRecord
	has_many :order_items
	belongs_to :user
	enum payment_method: {クレジットカード: 0,銀行振込:1}
end