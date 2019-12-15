class Address < ApplicationRecord
	belongs_to :user
	def address_select
    "〒""#{self.postal_code.insert(3, "-")} ""#{self.address} " " #{self.receiver_name}"
    end
end