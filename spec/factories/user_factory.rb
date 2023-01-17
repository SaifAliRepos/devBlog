FactoryBot.define do
  factory :user do
    name { 'Admin' }
    role { 'user' }
    sequence(:email, 10) { |n| "newuser#{n}@gmail.com" }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.now }
  end
end
