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
  has_many :images, class_name: "TweetImage", dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_members, through: :favorites, source: :member
  
end
