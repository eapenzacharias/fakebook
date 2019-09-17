# frozen_string_literal: true

class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
          destroy
        else
          @post.likes.create(user_id: current_user.id)
        end
        redirect_to request.referrer
    end

    def destroy
      if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        find_like
        @like.destroy
      end
      redirect_to request.referrer
    end
  
    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_like
        @like = @post.likes.find(params[:like_id])
        #@like = Like.where(user_id: current_user.id, post_id: params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
