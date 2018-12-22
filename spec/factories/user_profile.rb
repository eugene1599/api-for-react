FactoryBot.define do
  factory :user_profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    information { FFaker::Lorem.characters(rand(10...100)) }
    user
  end
end
