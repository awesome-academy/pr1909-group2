class Publisher < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 50 }
  has_many :author_book_publishers
  has_many :authors, through: :author_book_publishers
  has_many :books, through: :author_book_publishers
end
