class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
  accepts_nested_attributes_for :book, :author
end
