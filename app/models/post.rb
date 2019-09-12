# frozen_string_literal: true

class Post < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true

  belongs_to :user
end
