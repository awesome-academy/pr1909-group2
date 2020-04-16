class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  # validates :name,  format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true, uniqueness: true, length: { maximum: 30 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
