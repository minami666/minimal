class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  has_many :roomimages,dependent: :destroy
  has_many :items,dependent: :destroy
end
