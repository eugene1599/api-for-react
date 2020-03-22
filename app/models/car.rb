class Car
  include Documentable
  as_enum :car_type, %i[truck bus], field: { default: 0 }

  field :name, type: String

  belongs_to :user, index: true
  has_many :races, dependent: :destroy

  validates :car_type, presence: true

  index(name: 1)
end
