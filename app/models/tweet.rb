class Tweet < ApplicationRecord
  belongs_to :author, class_name: "Member", foreign_key: "member_id"
  
  validates :title, :body, presence: true
  validates :title, length: {maximum: 20}
  validates :body, length: {maximum: 10}
end
