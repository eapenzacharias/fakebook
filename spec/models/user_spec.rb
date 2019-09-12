require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end

  context 'validation tests' do
    it 'is valid with valid input' do
      expect(@user).to be_valid
    end

    it 'is invalid without a first name' do
      user = build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without a last name' do
      user = build(:user, l_name: nil)
      user.valid?
      expect(user.errors[:l_name]).to include('can\'t be blank')
    end

    it 'is invalid without an email address' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'is invalid without a vaild email address' do
      user = build(:user, email: 'invalid email')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'is invalid with a duplicate email address' do
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid without a password' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid with a short password' do
      user = build(:user, password: 'short')
      expect(user).to_not be_valid
    end

  end
end
