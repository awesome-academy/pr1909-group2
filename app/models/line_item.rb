class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def total_price
    book.price * quantity
  end
end
