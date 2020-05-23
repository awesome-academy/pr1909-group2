class Book < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :describe, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :image, presence: true
  has_many :book_users
  has_many :users, through: :book_users, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :book_publishers, dependent: :destroy
  has_many :publishers, through: :book_publishers
  accepts_nested_attributes_for :author_books
  accepts_nested_attributes_for :book_publishers
  mount_uploader :image, ImageUploader
  has_many :line_items, dependent: :destroy
  before_destroy :check_if_has_line_item

  TYPE_BOOK = [
    "Văn Học", "Teen", "Tiểu Thuyết", "Kỳ Ảo", "Truyện Trinh Thám",
    "Kinh dị", "Lịch sử", "Kinh Tế", "Văn hóa", "Khoa học", "Tâm Lí",
    "Kỹ năng sống",
  ].freeze

  private

  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'This book has a LineItem')
      return false
    end
  end
end
