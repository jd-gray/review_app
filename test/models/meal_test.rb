require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test "valid meal" do
    meal = Meal.new(title: 'Food', description: 'This is a description', price_cents: 1000)
    assert meal.valid?
  end

  test "meal without title" do
    meal = Meal.new(title: nil, description: 'This is a description', price_cents: 1000)
    assert meal.invalid?
  end

  test "meal without description" do
    meal = Meal.new(title: 'Food', description: nil, price_cents: 1000)
    assert meal.invalid?
  end

  test "meal price_cents cannot be negative" do
    meal = Meal.new(title: 'Food', description: 'This is a description', price_cents: -1)
    assert meal.invalid?
  end

  test "meal price_cents cannot be more than 10_000" do
    meal = Meal.new(title: 'Food', description: 'This is a description', price_cents: 10_001)
    assert meal.invalid?
  end

  test "meal calculates price" do
    meal = Meal.new(title: 'Food', description: 'This is a description', price_cents: 10_000)
    meal.save!
    assert_equal "100.00", meal.total_price
  end

  test "meal calculates another price" do
    meal = Meal.new(title: 'Food', description: 'This is a description', price_cents: 9_429)
    meal.save!
    assert_equal "94.29", meal.total_price
  end
end
