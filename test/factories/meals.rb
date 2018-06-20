FactoryBot.define do
  factory :meal do
    title  { Faker::Food.dish }
    description { Faker::Food.description }
    price_cents { Faker::Number.number(4) }
  end
end
