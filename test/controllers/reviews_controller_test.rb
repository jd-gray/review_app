require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @meal = create(:meal)

    sign_in @user
  end

  test "creates review" do
    assert_difference('Review.count') do
      post meal_reviews_url(@meal), as: :json, params: { review: { liked: true } }
    end

    assert_response :success
  end

  test "user creates another review" do
    review = create(:review, user: @user, meal: @meal)

    assert_no_difference('Review.count') do
      post meal_reviews_url(@meal), as: :json, params: { review: { liked: false, comment: 'Foo bar' } }
    end

    assert_response :unprocessable_entity
  end

  test "updates review" do
    review = create(:review, user: @user, meal: @meal)

    put meal_review_url(@meal, review), params: { review: { liked: false, comment: 'No bueno'} }

    assert_response :success
  end
end
