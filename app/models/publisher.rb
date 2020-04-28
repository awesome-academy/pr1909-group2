class Publisher < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 50 }
  has_many :book_publishers
  has_many :books, through: :book_publishers
  has_many :author_publishers
  has_many :authors, through: :author_publishers
end
