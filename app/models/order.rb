class Order < ApplicationRecord
	has_many :order_items
	belongs_to :user

  accepts_nested_attributes_for :order_items
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 発送待ち: 1, 発送済み: 2 }


  def amount
    sum = 0
    order_items.each do |order_item|
      sum += order_item.item.price * (1 + tax_rate) * order_item.item_count
    end
    sum.floor
  end


  def count
    sum = 0
    self.order_items.each do |order_item|
    sum +=  order_item.item_count
  end
  sum
  end

  def tax_include_billing_amount
    (billing_amount * (1 + tax_rate)).round()
  end

end