class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :banner, BannerUploader

  has_many :messages
  has_many :projects
  has_many :talents
  has_many :skills, through: :talents

  GENRES = %w[Pop R&B Hip-Hop Rap Rock Electronic EDM Funk Disco House Techno Classical Jazz Folk Soundtrack Traditional]

  before_update :capitalize_occupation
  before_update :clean_genres
  before_update :capitalize_bio

  private

  def capitalize_occupation
    self.main_occupation = main_occupation&.capitalize
  end

  def clean_genres
    self.genres.reject! { |genre| genre.blank? || !GENRES.include?(genre) }
  end

  def capitalize_bio
    self.bio = bio&.capitalize
  end
end

# Pour les views:
# User::GENRES
# f.select as collection
