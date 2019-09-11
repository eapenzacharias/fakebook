require 'factory_bot'

FactoryBot.define do
  rand_string = (0..50).map { (65 + rand(26)).chr }.join
  email = "post_random_#{rand_string.downcase}@email.com"

  factory :post do 
    content { "Some sample text as post" }
    association :user, factory: :user, email: email
  end
end