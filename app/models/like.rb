# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :member
  belongs_to :tweet
end
