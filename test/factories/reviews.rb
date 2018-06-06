FactoryBot.define do
  factory :review do
    liked false
    comment "MyText"
    user
    meal
  end
end
