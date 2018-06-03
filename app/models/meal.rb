class Meal < ApplicationRecord
	has_many :reviews, dependent: :destroy
end
