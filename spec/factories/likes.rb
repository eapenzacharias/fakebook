FactoryBot.define do
  factory :like do
    association :user, factory: :user, email: email
    association :post, factory: :post
  end
end
