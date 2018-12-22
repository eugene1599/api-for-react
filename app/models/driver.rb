class Driver < ApplicationRecord
  enum driver_type: %i[driver mechanic forwarder]
  has_and_belongs_to_many :races
  belongs_to :user
end
