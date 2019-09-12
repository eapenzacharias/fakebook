require 'factory_bot'

FactoryBot.define do
  email = Faker::Internet.email
  factory :post do 
    content { 'Some sample text as post' }
    association :user, factory: :user, email: email
  end
end
