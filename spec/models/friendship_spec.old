# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Creates a friendship' do
    it 'Creates a friendship with factory bot' do
      expect(FactoryBot.build(:friendship)).to be_valid
    end
  end

  context 'Can not create a friendship' do
    it 'Can not create a friendship without a user' do
      expect(FactoryBot.build(:friendship, user: nil)).not_to be_valid
    end

    it 'Can not create a friendship without a friend' do
      expect(FactoryBot.build(:friendship, friend: nil)).not_to be_valid
    end

    it 'Can not create a friendship twice' do
      user = FactoryBot.create(:user)
      friend = FactoryBot.create(:user)
      expect(FactoryBot.create(:friendship, user: user, friend: friend)).to be_valid
      expect(FactoryBot.build(:friendship, user: user, friend: friend)).not_to be_valid
    end
  end

  context 'The friendship relationship is not symmetrical' do
    it "carlos is antonios'friend but antonio is not carlos's friend" do
      george = FactoryBot.create(:user)
      sam = FactoryBot.create(:user)
      expect(FactoryBot.create(:friendship, user: george, friend: sam)).to be_valid
      sam.confirm_friend(sam.friend_requests[0])
      expect(sam.friends.length).to eql(0)
      expect(george.friends.length).to eql(1)
    end
  end
end
