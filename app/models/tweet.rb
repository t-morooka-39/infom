class Tweet < ApplicationRecord
  belongs_to :author, class_name: "Member", foreign_key: "member_id"
  
  validates :body, presence: true
  validate :body_length
  def body_length
    @chara_lim = 400
    body_for_validation = body.gsub(/\r\n/,"a")
    if body_for_validation.length > @chara_lim
      errors.add(:body, "は#{@chara_lim}文字以内で入力してください")
    end
  end
  has_many :likes, dependent: :destroy
  has_many :liker, through: :likes, source: :member 
  def like?(member)
    liker.include?(member)
  end
  has_many :comments, dependent: :destroy
  def comment_count
    if comments.loaded?
      comments.to_a.count
    else
      comments.count 
    end
  end
  # image 
  has_one_attached :image
  attribute :new_image
  validate if: :new_image do
    if new_image.respond_to?(:content_type)
      unless new_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_image, :invalid_image_type)
      end
    else
      errors.add(:new_image, :invald)
    end
  end
  before_save do 
    if new_image
      self.image = new_image
    end
  end
end
