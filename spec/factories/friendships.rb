# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    user { FactoryBot.build(:user) }
    friend { FactoryBot.build(:user) }
    confirmed { false }
  end
end
