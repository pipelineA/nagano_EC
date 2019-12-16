class Address < ApplicationRecord
	belongs_to :user

	validates :postal_code, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }
    validates :address, presence: true
    validates :receiver_name, presence: true
    before_validation :create_receiver_name

	def address_select
    "〒""#{self.postal_code.insert(3, "-")} ""#{self.address} " " #{self.receiver_name}"
    end
    private
    def create_receiver_name
    	if self.is_main_address == true
    	self.receiver_name = self.user.family_name + " " + self.user.first_name
        end
    end
end