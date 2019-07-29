FactoryBot.define do
  factory :tweet do
    body {"これはテストです"}
    association :author
  end
end
