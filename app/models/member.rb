class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, :last_name, :sex, presence: true
  validates :first_name, :last_name, length: {maximum: 10}
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

end
