class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 100}}
    validates :body, length: {maximum: 100}

        belongs_to :user
        has_many :favorites
    
        default_scope -> { order(created_at: :desc) }
    
    mount_uploader :image, ImageUploader
    mount_uploader :second_image, PostUploader
    mount_uploader :third_image, PostUploader
    mount_uploader :fourth_image, PostUploader
    mount_uploader :fifth_image, PostUploader
    mount_uploader :sixth_image, PostUploader
    
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
