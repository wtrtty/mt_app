require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(from_user_id: users(:michael).id,
                                     to_user_id: users(:archer).id)
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "should require a follower_id" do
    @like.from_user_id = nil
    assert_not @like.valid?
  end

  test "should require a followed_id" do
    @like.to_user_id = nil
    assert_not @like.valid?
  end
end
