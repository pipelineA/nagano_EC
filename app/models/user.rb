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

end