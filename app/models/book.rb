class Book < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :describe, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :image, presence: true
  has_many :book_users
  has_many :author_book_publishers
  has_many :authors, through: :author_book_publishers
  has_many :publishers, through: :author_book_publishers
  has_many :users, through: :book_users
  mount_uploader :image, ImageUploader

  TYPE_BOOK = ["Văn Học", "Teen", "Tiểu Thuyết", "Kỳ Ảo", "Truyện Trinh Thám",
 "Kinh dị", "Lịch sử", "Kinh Tế", "Văn hóa", "Khoa học", "Tâm Lí", "Kỹ năng sống"]
end
