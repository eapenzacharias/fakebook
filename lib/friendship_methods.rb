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
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship1 = inverse_friendships.find { |friendship| friendship.user == user }
    friendship1.confirmed = true
    friendship1.save
  end

  def friend?(user)
    friends.include?(user)
  end
end