class Publisher < ApplicationRecord
	validates :name, presence: true, length: { maximum: 30 }
	validates :address, presence:true, length: { maximum: 50 }
end
