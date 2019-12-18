class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :cart_items
  has_many :addresses
  accepts_nested_attributes_for :addresses

  enum is_unsubscribe: { 退会済: true, 有効: false }

  validates :family_name, :first_name, presence: true
  validates :kana_family_name, :kana_first_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]+-[0-9]+-[0-9]+\z/ }
  validates :email, presence: true

   def leave
    new_email = Time.current.to_i.to_s + '_' + self.email.to_s
    self.update(email: new_email, is_unsubscribe: true)
  end

  def unsubscribed?
    if self.is_unsubscribe == "退会済"
      true
    else
      false
    end
  end

  def cart_item_count
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.item_count
    end
    sum
  end

end