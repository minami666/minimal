class Roomimage < ApplicationRecord
  # ============ 画像のアップロード ============
  mount_uploader :image, ImageUploader


  # ============ 部屋 ============
  belongs_to :user
  has_many :roomlikes
  has_many :liked_users, through: :roomlikes, source: :user
end