class MealsController < ApplicationController
  def index
    @meals = Meal.all
    render json: @meals, status: :ok
  end

  def show
    @meal = Meal.find(params[:id])
    render json: @meal, status: :ok
  end
end
