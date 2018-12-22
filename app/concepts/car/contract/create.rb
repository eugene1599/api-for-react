module Car::Contract
  class Create < Reform::Form
    property :name
    property :car_type

    validates :name, presence: true
    validates :car_type, presence: true
  end
end
