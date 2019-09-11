require 'rails_helper'
require 'rspec/rails'
require 'shoulda/matchers'

RSpec.describe User do
  context 'validation tests' do
    it 'is valid with first name, last name, email, and password' do
      user = User.new(
        name: 'Aaron',
        l_name: 'Sumner',
        email: 'tester@example.com',
        password: 'tester'
      )
      expect(user).to be_valid
    end
  end

  it 'is invalid without a first name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include('can\'t be blank')
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
