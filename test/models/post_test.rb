require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:admin)
    @post = @user.posts.build(content: 'lorem ipsum')
  end

  test "shoud be vaild" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = " "
    assert_not @post.valid?
  end
  
end
