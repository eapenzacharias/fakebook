class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :find_post!

    def index
        @comments = @post.comments.order(created_at: :desc)
    end

    def create
      @comment = @post.comments.create(comment_params)
      redirect_to request.referrer

    end

    def destroy
      @comment = @article.comments.find(params[:id])

      if @comment.user_id == @current_user_id
        @comment.destroy
      else
        flash[:notice] = 'not owned by user'
      end
      redirect_to request.referrer
    end

    private

    def find_post!
        @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body,:post_id)
    end
end
