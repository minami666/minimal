class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  # ============ 画像のアップロード ============
  mount_uploader :image, ImageUploader

  # ============ フォロー／フォロワー機能 ============
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  # ============ 部屋 ============
  has_many :roomimages,dependent: :destroy
  has_many :roomlikes, dependent: :destroy
  has_many :liked_roomimages, through: :roomlikes, source: :roomimage
  def already_liked?(roomimage)
    self.roomlikes.exists?(roomimage_id: roomimage.id)
  end

  # ============ モノ ============
  has_many :items,dependent: :destroy

  # ============ ブログ ============
  has_many :blogs,dependent: :destroy


  # ============ 現在のパスワードの入力なしでユーザー情報を更新できる設定 ============
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
