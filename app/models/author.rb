class Author < ApplicationRecord
	validates :name, presence: true, length: { maximum: 30 }
	validates :country, presence: true
	validates :age, presence: true
end
