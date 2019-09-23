class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:create, :index, :destroy]

  def index
    @comments = @post.comments.order(created_at: :desc)
  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to request.referrer
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.user_id == @current_user_id
      @comment.destroy
    else
      flash[:notice] = 'not owned by user'
    end
    redirect_to request.referrer
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
