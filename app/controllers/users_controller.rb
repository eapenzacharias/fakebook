# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @user_friends = User.last(4)
    @recent_posts = @user.posts
  end
end
