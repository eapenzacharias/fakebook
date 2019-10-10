# frozen_string_literal: true
require 'friendship_methods'

class UsersController < ApplicationController
  include FriendshipMethods

  before_action :authenticate_user!
  def show
    @user = user.find(params[:id])
    @recent_posts = @user.posts
  end

  def index
    @users = User.order(created_at: :desc)
  end
end
