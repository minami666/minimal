class Roomlike < ApplicationRecord
  belongs_to :user
  belongs_to :roomimage
  validates_uniqueness_of :post_id, scope: :user_id
end
