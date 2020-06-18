class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :name, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end
  
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
