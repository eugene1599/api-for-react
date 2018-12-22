module Driver::Contract
  class Create < Reform::Form
    property :first_name
    property :last_name
    property :driver_type

    validates :first_name, presence: true
    validates :last_name, presence: true
  end
end
