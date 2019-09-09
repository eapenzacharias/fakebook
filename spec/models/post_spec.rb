# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'
require 'shoulda/matchers'

RSpec.describe Post, type: :model do
  describe 'User and timeline associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:postable) }
  end

  describe 'factories and instance method' do
    it 'has a valid factory' do
      user = create(:user)
      friend = create(:user)
      expect(build(:user_post, postable_id: friend.id, author_id: user.id)).to be_valid
    end
  end
end