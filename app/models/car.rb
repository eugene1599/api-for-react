class Car
  include Documentable
  as_enum :car_type, %i[truck bus]

  field :name, type: String

  belongs_to :user
  has_many :races, dependent: :destroy

  validates :car_type, presence: true
end
