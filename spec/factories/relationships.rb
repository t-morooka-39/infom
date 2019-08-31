# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    body { 'これはテストです' }
    association :tweet
  end
end
