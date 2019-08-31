# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :tweet
  validates :body, presence: true
  validate :body_length
  def body_length
    return if body.nil?
    
    @chara_lim = 200
    body_for_validation = body.gsub(/\r\n/, 'a')
    return unless body_for_validation.length > @chara_lim

    errors.add(:body, "は#{@chara_lim}文字以内で入力してください")
  end
end
