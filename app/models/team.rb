class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :country, presence: true
  validates :logo, presence: true
  mount_uploader :logo, LogoUploader
  validates_integrity_of  :logo
  validates_processing_of :logo
  has_many :players, dependent: :destroy
  has_many :home_matches, class_name: "Match", foreign_key: "home_team_id"
  has_many :away_matches, class_name: "Match", foreign_key: "away_team_id"
  def matches
    self.home_matches + self.away_matches
  end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end
