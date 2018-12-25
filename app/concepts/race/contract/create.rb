module Race::Contract
  class Create < Reform::Form
    property :start_date
    property :end_date
    property :race_price
    property :car_id
    property :customer_id
    property :cargo_weight
    property :driver_ids

    validates :start_date, presence: true
    validates :cargo_weight, numericality: { only_integer: false }
    validates :driver_ids, presence: true
  end
end
