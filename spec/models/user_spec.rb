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
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without a last name' do
      user = User.new(l_name: nil)
      user.valid?
      expect(user.errors[:l_name]).to include('can\'t be blank')
    end

    it 'is invalid without an email address' do
      user = User.new(
        name: 'Jane',
        l_name: 'Tester',
        email: '',
        password: 'tester'
      )
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'is invalid without a vaild email address' do
      user = User.new(
        name: 'Jane',
        l_name: 'Tester',
        email: 'tester',
        password: 'tester'
      )
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'is invalid with a duplicate email address' do
      User.create(
        name: 'Joe',
        l_name: 'Tester',
        email: 'tester@example.com',
        password: 'tester'
      )
      user = User.new(
        name: 'Jane',
        l_name: 'Tester',
        email: 'tester@example.com',
        password: 'tester'
      )
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
