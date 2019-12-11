class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

  enum making_status: { 製作待ち: 0, 製作中: 1, 製作完了: 2 }

  def tax_include_ordered_price
    (ordered_price * (1 + order.tax_rate)).round()
  end
end
