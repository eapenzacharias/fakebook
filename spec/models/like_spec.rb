require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = create(:user)
    @post = create(:post)
    @like = @user.likes.create(post: @post)
  end

  it 'creates a valid like' do
    expect(@like).to be_valid  
  end

  it 'invalid without a post' do
    like = @user.likes.create()
    expect(like).to_not be_valid 
  end

  it 'deletes a like' do
    @like.destroy
    expect(@post.likes.count).to eql(0)
  end
end
