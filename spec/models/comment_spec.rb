# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = create(:user)
    @post = create(:post)
    @comment = @user.comments.create(body: 'Sample text as comment', post: @post)
  end

  it 'creates a valid comment' do
    expect(@comment).to be_valid  
  end

  it 'counts number of comments for a post' do
    comment = @user.comments.create(body: 'Sample text as comment', post: @post)
    expect(@post.comments.count).to eql(2)
  end

  it 'deletes a comment' do
    @comment.destroy
    expect(@post.comments.count).to eql(0)
  end
end
