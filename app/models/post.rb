# frozen_string_literal: true

# Post for our fakebook app
class Post < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true

  belongs_to :user
end
