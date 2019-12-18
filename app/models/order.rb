class Order < ApplicationRecord
	has_many :order_items
	belongs_to :user

  attr_accessor :address_type
  attr_accessor :address_id
  validates :payment_method, presence: true
  # validates :address_type, presence: true
  validates :ordered_postal_code, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }, if: :check_address_type?
  validates :ordered_address, presence: true, if: :check_address_type?
  validates :ordered_receiver_name, presence: true, if: :check_address_type?

  accepts_nested_attributes_for :order_items
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 発送待ち: 1, 発送済み: 2 }
  accepts_nested_attributes_for :order_items


  def amount
    sum = 0
    self.order_items.each do |order_item|
      sum += order_item.item.price * (1 + self.tax_rate) * order_item.item_count
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

  def Order.total_amount
    sum = 0
    Order.all.each do |order|
      sum += order.billing_amount
    end
    sum
  end

  private
  def check_address_type?
    self.address_type
  end

end