class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   mount_uploader :avatar, AvatarUploader
   mount_uploader :banner, BannerUploader

   has_many :talents
   has_many :skills, through: :talents
end
