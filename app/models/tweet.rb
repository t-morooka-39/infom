# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'Member', foreign_key: 'member_id'
  validates :body, presence: true
  validate :body_length
  has_many :likes, dependent: :destroy
  has_many :liker, through: :likes, source: :member
  has_many :comments, dependent: :destroy
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  

  def body_length
    @chara_lim = 400
    return if body == nil
    
    body_for_validation = body.gsub(/[\r\n]/, '')
    return unless body_for_validation.length >= @chara_lim

    errors.add(:body, "は#{@chara_lim}文字以内で入力してください")
  end

  def like?(member)
    liker.include?(member)
  end
  
  def comment_count
    if comments.loaded?
      comments.to_a.count
    else
      comments.count
    end
  end
end
