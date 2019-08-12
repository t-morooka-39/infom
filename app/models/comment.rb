class Comment < ApplicationRecord
  belongs_to :tweet

  validates :body, length:{maximum: 20}
  validate :body_length
  def body_length
    @chara_lim = 200
    body_for_validation = body.gsub(/\r\n/,"a")
    if body_for_validation.length > @chara_lim
      errors.add(:body, "は#{@chara_lim}文字以内で入力してください")
    end
  end
end
