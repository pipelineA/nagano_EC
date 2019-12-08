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
end