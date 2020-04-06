class User < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6, maximum: 30 }
	validates :name,  format: { with: /\A[a-zA-Z]+\z/}
	validates :email, presence: true, uniqueness: true, length: { maximum: 30 }
end
