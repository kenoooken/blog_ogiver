class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    mount_uploader :picture, ImageUploader
    
            default_scope -> { order(created_at: :desc) }
    
     has_many :posts 
      has_many :favorites  
      has_many :favorite_posts, through: :favorites, source: :post 
    
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
