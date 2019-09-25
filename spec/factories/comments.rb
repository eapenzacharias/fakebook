require 'factory_bot'

FactoryBot.define do
  email = Faker::Internet.email
  factory :comment do
    body { 'Some sample text as comment' }
    association :user, factory: :user, email: email
    association :post, factory: :post
  end
end
