FactoryBot.define do
  factory :meal do
    title  { Faker::Food.dish }
    description { Faker::Food.description }
  end
end
