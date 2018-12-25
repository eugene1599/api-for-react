FactoryBot.define do
  factory :driver do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    driver_type { Driver.driver_types.keys[rand(0...1)] }
    user
  end
end
