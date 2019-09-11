FactoryBot.define do
  factory :user do
    name 'John'
    l_name 'Doe'
    email 'john@example.com'
    password 'johndoe'
    password_confirmation 'johndoe'
  end

  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    active true
  end
end
