class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :roomsimage

  validates :text, presence: true
  validates :user_id, presence: true
  validates :roomimage_id, presence: true
end
