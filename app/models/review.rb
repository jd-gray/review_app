class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  after_save :update_meal_rating_count

  validates :liked, inclusion: { in: [ true, false ] }
  validates :comment, presence: true, if: -> { !liked }
  validates :meal_id, uniqueness: { scope: :user_id, message: 'You have already rated this meal' }, on: :create

  private

  def update_meal_rating_count
    liked ? meal.increment!(:total_rating) : meal.decrement!(:total_rating)
  end
end
