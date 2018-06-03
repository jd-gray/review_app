require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup 
    @user = create(:user)
    @meal = create(:meal)
  end

  test "valid review" do
    review = Review.new(liked: true, comment: nil, meal: @meal, user: @user)
    assert review.valid?
  end

  test "review without user" do
    review = Review.new(liked: true, comment: nil, meal: @meal, user: nil)
    refute review.valid?
    assert_not_nil review.errors[:user]
  end

  test "review without meal" do
    review = Review.new(liked: true, comment: nil, meal: nil, user: @user)
    refute review.valid?
    assert_not_nil review.errors[:meal]
  end
end
