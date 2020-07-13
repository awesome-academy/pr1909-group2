class Hometeam < ApplicationRecord
  belongs_to :team
  has_many :matches, dependent: :destroy
  accepts_nested_attributes_for :team
end
