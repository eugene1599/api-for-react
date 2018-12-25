json.array! @model do |race|
  json.id race.id
  json.race_price race.race_price
  json.cargo_weight race.cargo_weight
  json.start_date race.start_date
  json.end_date race.end_date
  json.customer_id race.customer.id
  json.driver_ids race.driver_ids
  json.car_id race.car_id
end
