class Address < ApplicationRecord
	belongs_to :user

	validates :postal_code, presence: true, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }
    validates :address, presence: true

	def address_select
    "〒""#{self.postal_code.insert(3, "-")} ""#{self.address} " " #{self.receiver_name}"
    end
end