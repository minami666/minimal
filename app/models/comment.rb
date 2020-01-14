class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :roomimage
  
  validates :text, presence: true
end
