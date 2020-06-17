class Player < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :diagram, DiagramUploader
  enum preferred_foot: { Right: 0, Left: 1, Both: 2 }
  enum nationality: {
    Belgium: 0, France: 1, Brazil: 2, England: 3, Uruguay: 4, Croatia: 5, Portugal: 6, Spain: 7,
    Argentina: 8, Colombia: 9, Mexico: 10, Switzerland: 11, Italy: 12, Netherlands: 13, Germany: 14, Denmark: 15,
    Chile: 16, Sweden: 17, Poland: 18, Senegal: 19, Peru: 20,
  }
end
