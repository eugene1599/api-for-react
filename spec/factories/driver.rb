FactoryBot.define do
  factory :driver do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    driver_type { rand(0...1) }
    user
  end
end
