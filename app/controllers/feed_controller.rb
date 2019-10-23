# frozen_string_literal: true

class FeedController < ApplicationController
  def index
    @recent_posts = Post.order(created_at: :desc).where(user_id: Friendship.where(user_id: current_user.id,
                                                                                   confirmed:true).select('friend_id'))
    @new_post = Post.new
  end
end
