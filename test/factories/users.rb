FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'super_strict_password' }
    password_confirmation { 'super_strict_password' }
  end
end
