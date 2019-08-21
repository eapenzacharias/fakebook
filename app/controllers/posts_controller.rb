class PostsController < ApplicationController
    def def new
        if signed_in?
            @post = Post.new
        else
            redirect_to signin_path
        end 
    end
    def create
        post =  current_user.authored_posts.build(post_params)
        
        if post.save
            flash[:notice] = 'Post was sucessful'
        else
            flash[:alert] = 'Error. Try again!'
        end
        redirect_to feed_path
    end
    def destroy
        post = Post.find(params[:id])
        if post.user_id = current_user
            if post.delete?
                flash[:notice] = 'Post deleted sucessfully'
            else
                flash[:alert] = 'Error in deleting'
            end
        else
            flash[:alert] = 'The post you are trying to delete, does not belong to you'
        end
        redirect_to feed_path
    end
    def edit
        @user = current_user
        @post = Post.find(params[:id])  
    end
    def update
        post = Post.find(params[:id])
        if post.user_id = current_user
            if post.update(update_params)
                flash[:notice] = 'Post updated sucessfully'
            else
                flash[:alert] = 'Error in updating'
            end
        else
            flash[:alert] = 'The post you are trying to update, does not belong to you'
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
end
