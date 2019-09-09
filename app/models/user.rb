# frozen_string_literal: true

class User < ApplicationRecord
  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable
  has_secure_password
  validates :name, presence: true
  validates :l_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  has_many :posts, dependent: :destroy
end
