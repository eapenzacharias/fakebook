module FriendshipMethods
  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    if !friends_array.nil?
      friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    else
      friends_array = inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    end
    friends_array.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend if !friendship.confirmed }.compact
  end

  def pending_requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.confirmed }.compact
    # friendships.map { |friendship| friendship.friend}.compact
  end

  def confirm_friend
    friendship1 = Friendship.find_by(user_id: user, friend_id: current_user.id)
    friendship1.confirmed = true
    friendship1.save
  end

  def friend?(user)
    friends.include?(user)
  end
end