class Tweet < ApplicationRecord
  belongs_to :author, class_name: "Member", foreign_key: "member_id"
end
