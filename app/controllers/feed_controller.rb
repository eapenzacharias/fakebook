class FeedController < ApplicationController
  def index
    @user_friends = User.last(4)
    @user_posts = Post.order(created_at: :desc)
    @new_post = Post.new()
  end
end
