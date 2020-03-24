class Race
  include Documentable

  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :cargo_weight, type: Float
  field :race_price, type: Float, default: 0.0

  belongs_to :car, index: true
  belongs_to :customer, index: true
  belongs_to :user, index: true
  has_and_belongs_to_many :drivers, index: true

  embeds_many :reports
end
