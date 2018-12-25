FactoryBot.define do
  factory :car do
    name { FFaker::Book.title }
    car_type { Car.car_types.keys[rand(0...1)] }
    user
  end
end
