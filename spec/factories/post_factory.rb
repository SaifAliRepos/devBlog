FactoryBot.define do

  factory :post do
    association :user
    name { "First Post" }
    title { "This is our first post" }
  end

end
