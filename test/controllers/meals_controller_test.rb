require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @meal = create(:meal)
    sign_in @user
  end

  test "should get index" do
    get meals_url, as: :json
    assert_response :success
  end

  test "should get show" do
    get meal_url(@meal)
    assert_response :success
  end
end
