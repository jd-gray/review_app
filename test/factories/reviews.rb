FactoryBot.define do
  factory :review do
    liked false
    comment "MyText"
    user_id 1
    meal_id 1
  end
end
