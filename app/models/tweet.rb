# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'Member', foreign_key: 'member_id'

  validates :body, presence: true
  validate :body_length
  def body_length
    @chara_lim = 400
    body_for_validation = body.gsub(/[\r\n]/, '')
    return unless body_for_validation.length >= @chara_lim

    errors.add(:body, "は#{@chara_lim}文字以内で入力してください")
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
  has_one_attached :image2
  attribute :new_image2
  validate if: :new_image do
    if new_image.respond_to?(:content_type)
      unless new_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_image, :invalid_image_type)
      end
    else
      errors.add(:new_image, :invald)
    end
  end
  validate if: :new_image2 do
    if new_image2.respond_to?(:content_type)
      unless new_image2.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_image2, :invalid_image_type)
      end
    else
      errors.add(:new_image2, :invald)
    end
  end
  before_save do
    self.image = new_image if new_image
    self.image2 = new_image2 if new_image2
  end
end
