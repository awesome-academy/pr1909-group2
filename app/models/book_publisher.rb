class BookPublisher < ApplicationRecord
  belongs_to :book
  belongs_to :publisher
  accepts_nested_attributes_for :book, :publisher
end
