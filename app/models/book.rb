class Book < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :describe, presence: true, length: { maximum: 100 }
  validates :price, presence: true
end
