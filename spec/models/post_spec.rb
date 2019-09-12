# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @post = create(:post)
  end
  it "is valid with vaild attributes" do
    expect(@post).to be_valid
  end

  it "is invalid without content" do
    post = build(:post, content: nil)
    expect(post).to_not be_valid
  end

  it "is invalid with empty content" do
    post = build(:post, content: '')
    expect(post).to_not be_valid
  end

  it "is invalid without a user" do
    post = build(:post, user_id: nil)
    expect(post).to_not be_valid
  end
end