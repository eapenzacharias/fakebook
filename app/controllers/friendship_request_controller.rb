# frozen_string_literal: true

class FriendshipRequestController < ApplicationController
  def index
    @friendship_request = current_user.friend_requests
  end

  def create
    @friendship_request = Friendships.new(friendship_params)
    @friendship_request.user_id = current_user.id
    if friendship_request.save
      flash[:success] = 'new request sent'
    else
      flash[:notice] = 'Cant send request'
    end
    redirect_to users_index_path
  end

  def show
    @friendship_request = current_user.friend_requests
  end

  private

  def friendship_params
    params.require(:friendship_request).permit(:friend_id)
  end
end
