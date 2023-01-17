FactoryBot.define do

  factory :suggestion do
    association :user
    association :post
    find { "Hello" }
    replace { "Hell" }
  end

end
