require 'rails_helper'
require 'support/factory_bot'

# FactoryBot.define do
#   factory :post do
#     user
#     content Faker::Lorem.paragraphs
#     association user
#   end

#   factory :post do
#     content Faker::Lorem.paragraphs

#     factory :approved_post do
#       approved { true }
#     end
#   end
# end

FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "Content #{n}" }
    association :user
  end
end
