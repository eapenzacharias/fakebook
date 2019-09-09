require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with first name, last name, email, and password' do
    user = User.new(
      name: 'Aaron',
      l_name: 'Sumner',
      email: 'tester@example.com',
      password: 'tester'
    )
    expect(user).to be_valid
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
