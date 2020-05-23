class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :order, dependent: :destroy
  def add_book(book_id)
    current_item = line_items.find_by_book_id(book_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:book_id => book_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
