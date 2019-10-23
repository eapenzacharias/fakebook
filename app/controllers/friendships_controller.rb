# frozen_string_literal: true

require 'friendship_methods'

class FriendshipsController < ApplicationController
  include FriendshipMethods
  before_action :authenticate_user!
  def index
    @pending_friendships = current_user.pending_friendships
    @confirmed_friendships = current_user.confirmed_friendships
    @friendships = current_user.friendships
  end

  def create
    @friendship_request = Friendship.new(friend_id: params[:id], confirmed: false)
    @friendship_request.user_id = current_user.id
    user = User.find_by(id: params[:id])
    if @friendship_request.save
      flash[:success] = "You send a friend request to #{user}"
    elsif current_user.friends?(user)
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
      flash[:success] = "Now you are a #{user}'s friend"
    else
      flash[:error] = 'There was a problem'
    end
    redirect_to friendships_path
  end
end
