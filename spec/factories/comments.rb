# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'これはテストです' }
    tweet
  end
end
