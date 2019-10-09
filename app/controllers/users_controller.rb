# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts
  end

  def index
    @users = User.order(created_at: :desc)
  end

  def confirm_friend(user)
    friendship1 = inverse_friendships.find { |friendship| friendship.user == user }
    friendship1.confirmed = true
    friendship1.save
  end
end
