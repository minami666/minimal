class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :text, length: { in: 1..400 }
end