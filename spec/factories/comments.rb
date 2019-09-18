FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { nil }
    post { nil }
  end
end
