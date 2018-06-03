require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test "valid meal" do
    meal = Meal.new(title: 'Food', description: 'This is a description')
    assert meal.valid?
  end

  test "meal without title" do
    meal = Meal.new(title: nil, description: 'This is a description')
    assert meal.invalid?
  end

  test "meal without descript" do
    meal = Meal.new(title: 'Food', description: nil)
    assert meal.invalid?
  end
end
