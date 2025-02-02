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

  test "review without liked" do
    review = Review.new(liked: nil, comment: nil, meal: @meal, user: @user)
    assert review.invalid?
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

  test "negative review must have a comment" do
    review = Review.new(liked: false, comment: nil, meal: @meal, user: @user)
    assert review.invalid?

    review = Review.new(liked: false, comment: 'Food is bad', meal: @meal, user: @user)
    assert review.valid?
  end

  test "positive review updates total rating for meal" do
    review = Review.create!(liked: true, comment: nil, meal: @meal, user: @user)

    assert_equal 1, @meal.reload.total_rating
  end

  test "negative review updates total rating for meal" do
    review = Review.create!(liked: false, comment: 'Food is bad', meal: @meal, user: @user)

    assert_equal -1, @meal.reload.total_rating
  end

  test "multiple reviews update total rating for meal" do
    review1 = Review.create!(liked: true, comment: nil, meal: @meal, user: create(:user))
    assert_equal 1, @meal.reload.total_rating

    review2 = Review.create!(liked: true, comment: nil, meal: @meal, user: create(:user))
    assert_equal 2, @meal.reload.total_rating

    review3 = Review.create!(liked: false, comment: 'Food is bad', meal: @meal, user: create(:user))
    assert_equal 1, @meal.reload.total_rating
  end

  test "user can create review once" do
    review = Review.create!(liked: true, comment: nil, meal: @meal, user: @user)
    assert review.valid?

    exception = assert_raise(ActiveRecord::RecordInvalid) do
      Review.create!(liked: false, comment: 'Food is bad', meal: @meal, user: @user)  
    end
    assert_equal 'Validation failed: Meal You have already rated this meal', exception.message
    assert_equal 1, Review.all.size
  end

  test "user can update review" do
    review = Review.create!(liked: true, comment: nil, meal: @meal, user: @user)
    assert_equal 1, Review.all.size

    review.update!(liked: false, comment: 'I do not like this anymore', meal: @meal, user: @user)
  
    assert_equal false, review.liked
    assert_equal 'I do not like this anymore', review.comment
    assert_equal 1, Review.all.size
  end
end
