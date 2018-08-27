class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :banner, BannerUploader

  has_many :messages
  has_many :projects

  GENRES = %w[Pop R&B Hip-Hop Rap Rock Electronic EDM Funk Disco House Techno Classical Jazz Folk Soundtrack Traditional]
  validates :genre, inclusion: { in: GENRES, allow_blank: true }
end

# Pour les views:
# User::GENRES
# f.select as collection
