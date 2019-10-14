# frozen_string_literal: true

class User < ApplicationRecord
  has_many :friendships
  has_many :inverse_friendships
  has_many :friends, through: :friendships
  has_and_belongs_to_many :friends
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

  def pending_friendships
    #friendships.where(confirmed: false) 
    inverse_friendships.where(confirmed: false)
  end

  def confirmed_friendships
    friendships.where(confirmed: true)
  end

end
