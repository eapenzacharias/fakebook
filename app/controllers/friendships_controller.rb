# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friendship_requests = current_user.friend_requests
    @pending_friends = current_user.pending_friends
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added friend.'
    else
      flash[:error] = 'Unable to add friend.'
    end
    redirect_to current_user
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to current_user
  end

  def update
    user = User.find_by(id: params[:id])
    if current_user.confirm_friend(user)
      flash[:success] = "Now you are a #{user.name}'s friend"
    else
      flash[:error] = 'There was a problem'
    end
    redirect_to 'feed/index'
  end

end
