# frozen_string_literal: true

class FeedController < ApplicationController
  def index
    @user_friends = User.last(4)
    @recent_posts = Post.order(created_at: :desc)
    @new_post = Post.new
  end
end
