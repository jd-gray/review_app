ActiveRecord::Base.transaction do
  User.create!(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123', role: 'admin')

  10.times do
    Meal.create!(
      title: Faker::Food.unique.dish,
      description: Faker::Food.unique.description,
      price_cents: Faker::Number.number(4)
    )
  end
end
