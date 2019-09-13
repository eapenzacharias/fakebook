# frozen_string_literal: true

class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :validate_like, only: %i[react]

    def react
        @like.nil? create : destroy
    end
    
    def create
        like = current_user.likes.build(post: @post, liked:1)
        if like.save
          flash[:notice] = 'Post liked successfully'
        else
          flash[:alert] = 'Error. Try again!'
        end
    end

    def destroy
        if @like.destroy
          flash[:notice] = 'Post disliked '
        else
          flash[:alert] = 'Error. Try again!'
        end
    end

    private

    def validate_like
        @post = Post.find(params[:post_id])
        @like = Like.where(post: @post, user: current_user)
    end
end
