module LikesHelper
    def reacted?(post)
        !Like.where(post: post, user: current_user).first.nil?
    end
end
