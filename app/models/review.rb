class Review < ApplicationRecord
	belongs_to :user
	belongs_to :meal

  after_save :update_meal_rating_count

  validates :comment, presence: true, if: -> { !liked }

  private

  def update_meal_rating_count
    liked ? meal.increment!(:total_rating) : meal.decrement!(:total_rating)
  end
end
