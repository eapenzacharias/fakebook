# frozen_string_literal: true

class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable

  validates :name, presence: true
  validates :l_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

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
