# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :authenticate_user!
  def show
    @users = User.find_by(params[:user_id])
    @recent_posts = @users.posts
#    @mutual_friendships = mutual_friends(@users)
  end

  def index
    @users = User.order(created_at: :desc)
  end
end
