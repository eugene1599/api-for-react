FactoryBot.define do
  factory :car do
    name { FFaker::Book.title }
    car_type { rand(0..1) }
    user
  end
end
