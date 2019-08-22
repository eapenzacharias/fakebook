class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only [:destroy, :edit, :update]
  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to signin_path
    end
  end

  def create
    post = current_user.authored_posts.build(post_params)

    if post.save
      flash[:notice] = 'Post was sucessful'
    else
      flash[:alert] = 'Error. Try again!'
    end
    redirect_to feed_path
  end

  def destroy
    @post = Post.find(params[:id])
    if post.delete?
      flash[:notice] = 'Post deleted sucessfully'
    else
      flash[:alert] = 'Error in deleting'
    end
    redirect_to feed_path
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(update_params)
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
    validate_user(@post.user_id)
  end
end
