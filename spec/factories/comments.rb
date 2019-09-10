# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'これはテストです' }
    association :tweet
  end
end
