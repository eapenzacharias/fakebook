require 'factory_bot'

FactoryBot.define do
  email = Faker::Internet.email

  factory :user do |i|
    i.email { email }
    i.password { 'password' }
    i.password_confirmation { 'password' }
    i.name { 'John' }
    i.l_name { 'Doe' }
    i.birthday {Date.current()}
  end
end
