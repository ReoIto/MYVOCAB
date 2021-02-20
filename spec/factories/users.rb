FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "Test#{n}@example.com" }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end
