# frozen_string_literal: true
require 'friendship_methods'

class FriendshipsController < ApplicationController
  include FriendshipMethods

  def index
    @friendship_requests = current_user.friend_requests
    @pending_friends = current_user.pending_friends
    @friends = current_user.friends
  end

  def create
    @friendship_request = Friendship.new(friend_id: params[:id], confirmed: false)
    @friendship_request.user_id = current_user.id
    other = User.find_by(id: params[:id])
    if @friendship_request.save
      flash[:success] = "You send a friend request to #{other.name}"
    elsif current_user.friend?(other)
      flash[:alert] = "You and #{other.name} are already friends"
    else
      flash[:error] = "You already sent a friend request to  #{other.name}"
    end
    redirect_to friendships_path
  end

  def update
    f = Friendship.find_by(friend_id: current_user.id, user_id: params[:id])
    user = User.find_by(id: f.user_id)
    if f.confirm_friendship
      flash[:success] = "Now you are a #{user.name}'s friend"
    else
      flash[:error] = 'There was a problem'
    end
    redirect_to friendships_path
  end
end
