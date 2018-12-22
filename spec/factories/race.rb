FactoryBot.define do
  factory :race do
    start_date { Time.current }
    end_date { Time.current + 10.days }
    cargo_weight { rand(0...1000) }
    user
    customer
    car
    driver_ids { [create(:driver).id] }


  end
end
