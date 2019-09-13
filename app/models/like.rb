# frozen_string_literal: true

class Post < ApplicationRecord
    validates :user_id, uniqueness: { scope: :post_id }
    validates :liked, presence: true
  
    belongs_to :user
    belongs_to :post
  end