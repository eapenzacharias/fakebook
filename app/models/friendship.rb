class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user, scope: :friend
  validates :confirmed, exclusion: { in: [nil] }

  def confirm_friendship
    self.confirmed = true
    save

    Friendship.create(user_id: friend_id,
                      friend_id: user_id,
                      confirmed: true)
  end
end
