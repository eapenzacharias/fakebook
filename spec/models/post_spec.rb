# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_bot'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:content) }

  it 'has a valid factory' do
    Post.build(:post).to be_valid
  end
end
