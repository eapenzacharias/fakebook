require 'factory_bot'

FactoryBot.define do
  email = Faker::Internet.email

  factory :user do |i|
    i.email { email }
    i.password {"password"}
    i.password_confirmation {"password"}
    i.name {"John"}
    i.l_name {"Doe"}
    i.birthday {Date.current()}
  end
  #factory :random_user, class: User do
  #  first_name { Faker::Name.first_name }
  #  last_name { Faker::Name.last_name }
  #  email { Faker::Internet.safe_email }
  #  active true
  #end
end
