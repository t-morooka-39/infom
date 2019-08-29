# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'Member'
  belongs_to :followed, class_name: 'Member'

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  def like?(member)
    liker.include?(member)
  end
end
