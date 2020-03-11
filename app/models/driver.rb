class Driver < ApplicationRecord
  # enum driver_type: %i[driver mechanic forwarder]

  field :first_name, type: String
  field :last_name, type: String
  field :driver_type, type: String

  belongs_to :user
  has_and_belongs_to_many :races
end
