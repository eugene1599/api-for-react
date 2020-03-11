class Race < ApplicationRecord
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :cargo_weight, type: Float
  field :race_price, type: Float, default: 0.0

  belongs_to :car
  belongs_to :customer
  belongs_to :user
  has_and_belongs_to_many :drivers
  has_many :reports, dependent: :destroy
end
