# frozen_string_literal: true
require 'friendship_methods'

class UsersController < ApplicationController
  include FriendshipMethods
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts
    @mutual_friendships = Friendship.where(user_id: current_user, confirmed: true, friend_id: Friendship.where(user_id: @user.id, confirmed: true).select('friend_id'))
  end

  def self.all_except(user)
    where.not(id: user)
  end

  def index
    @users = User.where.not(id: current_user.friends).where.not(id: current_user).paginate(page: params[:page])
  end
end
