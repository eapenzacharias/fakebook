# frozen_string_literal: true

class FeedController < ApplicationController
  def index
    @recent_posts = Post.where(user_id: current_user.friends).order(created_at: :desc)
    @recent_posts += Post.where(user_id: current_user)
    @new_post = Post.new
  end
end
