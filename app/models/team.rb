class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :country, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  validates_integrity_of  :image
  validates_processing_of :image
  
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
