FactoryBot.define do
  factory :customer do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    company { FFaker::Book.title }
    user
  end
end
