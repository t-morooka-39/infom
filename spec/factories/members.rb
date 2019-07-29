FactoryBot.define do
  factory :member, aliases: [:author] do
    first_name {"じゅんぺい"}
    last_name {"森田"}
    sex {1}
    sequence(:email) {|n| "test#{n}@example.com"}
    password {"hogehoge"}
  end
end
