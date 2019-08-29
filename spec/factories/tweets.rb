# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    body { 'これはテストです' }
    association :author
  end
end
