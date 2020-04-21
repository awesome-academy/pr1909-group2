class AuthorBookPublisher < ApplicationRecord
  belongs_to :author
  belongs_to :book
  belongs_to :publisher
end
