class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :roomsimage

  validates :text, presence: true
end
