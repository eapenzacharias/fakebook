# frozen_string_literal: true
require 'friendship_methods'

class FriendshipsController < ApplicationController
  include FriendshipMethods

  def index
    @pending_requests = current_user.pending_requests
    @pending_friends = current_user.pending_friends
    @friends = current_user.friends
  end

  def create
    @friendship_request = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    @friendship_request.user_id = current_user.id
    user = User.find_by(id: params[:id])
    if @friendship_request.save
      flash[:success] = "You send a friend request to #{user}"
    elsif current_user.friend?(user)
      flash[:alert] = "You and #{user} are already friends"
    else
      flash[:error] = "You already sent a friend request to  #{user}"
    end
    redirect_to friendships_path
  end

  def update
    f = Friendship.find_by(friend_id: current_user.id, user_id: params[:id])
    user = User.find_by(id: f.user_id)
    if f.confirm_friendship
      flash[:success] = "Now you are a #{users.name}'s friend"
    else
      flash[:error] = 'There was a problem'
    end
    redirect_to friendships_path
  end
end
