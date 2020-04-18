class Author < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :country, presence: true
  validates :age, presence: true
  has_many :author_book_publishers
  has_many :publishers, through: :author_book_publishers
  has_many :books, through: :author_book_publishers
end
