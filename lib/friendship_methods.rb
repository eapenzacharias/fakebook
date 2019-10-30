module FriendshipMethods
  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed==true }
    if !friends_array.nil?
      friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed==true }
    else
      friends_array = inverse_friendships.map { |friendship| friendship.user if friendship.confirmed==true }
    end
    friends_array.compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def find_user(user)
    User.find_by(user)
  end
end