class Author < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :country, presence: true
  validates :age, presence: true
  has_many :author_books
  has_many :books, through: :author_books
  has_many :author_publishers
  has_many :publishers, through: :author_publishers
end
