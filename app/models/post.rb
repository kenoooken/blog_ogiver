class Post < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 140}}


        belongs_to :user
        has_many :favorites
    
        default_scope -> { order(created_at: :desc) }
    
    mount_uploader :image, ImageUploader
    mount_uploader :second_image, ImageUploader
    mount_uploader :image, ImageUploader
    mount_uploader :image, ImageUploader
    mount_uploader :image, ImageUploader
    
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
