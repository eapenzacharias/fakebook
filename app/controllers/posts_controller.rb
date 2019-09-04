# frozen_string_literal: true

class PostsController < ApplicationController
  # Posts controller for our fakebook app
  before_action :authenticate_user!
  before_action :set_post, only: [:destroy, :show, :update]

  def new
    @post = current_user.post.build
  end

  def create
    post = current_user.posts.build(post_params)

    if post.save
      flash[:notice] = 'Post was sucessful'
    else
      flash[:alert] = 'Error. Try again!'
    end
    redirect_to posts_path
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post deleted sucessfully'
    else
      flash[:alert] = 'Error in deleting'
    end
    redirect_to feed_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(update_params)
      flash[:notice] = 'Post updated sucessfully'
    else
      flash[:alert] = 'Error in updating'
    end
    redirect_to feed_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def update_params
    params.require(:update).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
