class Tournament < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
  validates :country, presence: true
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
  validates_integrity_of  :picture
  validates_processing_of :picture

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end