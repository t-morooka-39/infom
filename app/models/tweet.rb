# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'Member', foreign_key: 'member_id'

  validates :body, presence: true
  validate :body_length
  def body_length
    @chara_lim = 400
    return if body == nil
    
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
  mount_uploaders :images, ImageUploader
  validate :validate_images
  def validate_images
    errors.add(:images, "は4枚まで挿入できます。") if self.images.size > 4
  end
end
