require 'test_helper'

class PromoTest < ActiveSupport::TestCase
  def setup
    @meal = create(:meal)
  end

  test "promo validates start_time" do
    promo = Promo.new(start_time: Time.now - 1.day, end_time: Time.now + 1.hour, meal: @meal, discount_cents: Faker::Number.number(2))
    assert promo.invalid?
  end

  test "promo validates end_time" do
    promo = Promo.new(start_time: Time.now + 1.day, end_time: Time.now, meal: @meal, discount_cents: Faker::Number.number(2))
    assert promo.invalid?
  end

  test "promo has valid start and end time" do
    promo = Promo.new(start_time: Time.now + 1.day, end_time: Time.now + 2.days, meal: @meal, discount_cents: Faker::Number.number(2))
    assert promo.valid?
  end

  test "promo is upcoming" do
    promo = Promo.new(start_time: Time.now + 1.day, end_time: Time.now + 2.days, meal: @meal, discount_cents: Faker::Number.number(2))
    promo.save!
    assert_equal true, promo.upcoming?
  end

  test "promo has ended" do
    promo = Promo.new(start_time: Time.now - 2.day, end_time: Time.now - 1.days, meal: @meal, discount_cents: Faker::Number.number(2))
    promo.save!(validate: false)
    assert_equal true, promo.ended?
  end
end
