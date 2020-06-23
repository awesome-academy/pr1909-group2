class Player < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :diagram, DiagramUploader
  validates :name, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :shirt_number, presence: true
  validates :image, presence: true
  validates :diagram, presence: true
  validates :strengths, presence: true
  validates :weaknesses, presence: true
  validates :age, presence: true
  enum preferred_foot: { Right: 0, Left: 1, Both: 2 }
end
