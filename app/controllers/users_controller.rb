# frozen_string_literal: true
require 'friendship_methods'

class UsersController < ApplicationController
  include FriendshipMethods
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts
  end

  def index
    @users = User.except(current_user).except(current_user.friends).paginate(page: params[:page], per_page: 10)
  end
end
