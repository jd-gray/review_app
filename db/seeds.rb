User.create!(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123', role: 'admin')

10.times do
  Meal.create!(
    title: Faker::Food.unique.dish,
    description: Faker::Food.unique.description
  )
end