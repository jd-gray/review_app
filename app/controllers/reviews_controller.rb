class ReviewsController < ApplicationController
  before_action :find_meal, only: :create
  before_action :find_review, only: :update

  def create
    review = @meal.reviews.build(review_params)
    review.user_id = current_user.id

    if review.save
      render json: review, status: :ok
    end
  end

  def update
    if @review.update_attributes(review_params)
      render json: @review, status: :ok
    end
  end

  private

  def find_meal
    @meal = Meal.find(params[:meal_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:liked, :comment)
  end
end
