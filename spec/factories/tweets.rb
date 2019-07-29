FactoryBot.define do
  factory :tweet do
    title {"Test"}
    body {"これはテストです"}
    association :author
  end
end
