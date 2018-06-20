class Meal < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :reviews, dependent: :destroy
  has_many :promos, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_cents, presence: true
  validates :price_cents, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }

  def total_price
    number_with_precision(price_cents / 100.00, precision: 2)
  end
end
