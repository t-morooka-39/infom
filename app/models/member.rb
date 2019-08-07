class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, :last_name, :sex, presence: true
  validates :first_name, :last_name, length: {maximum: 10}
  validates :introduction, length: {maximum: 30}
  validates :sex, numericality:{
    only_integer: true,
    greater_than: 0,
    less_than: 3,
    allow_blank: true
  }
  validate if: :new_profile_picture do
    if new_profile_picture.respond_to?(:content_type)
      unless new_profile_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_picture, :invalid_image_type)
      end
    else
      errors.add(:new_profile_picture, :invalid)
    end
  end
  has_many :tweets, dependent: :destroy
  has_many :favorites
  has_many :favorite_tweets, through: :favorites, source: :tweet
  # pictureアップロード
  has_one_attached :profile_picture
  attribute :new_profile_picture
  attribute :remove_profile_picture, :boolean
  before_save do 
    if new_profile_picture
      self.profile_picture = new_profile_picture
    elsif remove_profile_picture
      self.profile_picture.purge
    end
  end
  def favorite?(tweet)
    tweet && tweet.author != self && !favorites.exists?(tweet_id: tweet.id)
  end
  def delete_favorite?(tweet)
    tweet && tweet.author != self && favorites.exists?(tweet_id: tweet.id)
  end
  # フォロー機能の追加
  has_many :active_relationships, class_name: "Relationship",
   foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed 
  has_many :followers, through: :passive_relationships, source: :follower
  def follow(other_member)
    active_relationships.create(followed_id: other_member.id)
  end
  def unfollow(other_member)
    active_relationships.find_by(followed_id: other_member.id).destroy
  end
  def following?(other_member)
    following.include?(other_member)
  end
  #いいね機能の追加
  has_many :likes
end
