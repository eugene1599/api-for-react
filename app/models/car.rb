class Car < ApplicationRecord
  # enum car_type: %w[truck bus]

  field :name, type: String
  field :car_type, type: String

  belongs_to :user
  has_many :races, dependent: :destroy
end
