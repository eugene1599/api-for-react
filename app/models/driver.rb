class Driver
  include Documentable
  as_enum :driver_type, %i[driver mechanic forwarder], field: { default: 0 }

  field :first_name, type: String
  field :last_name, type: String

  belongs_to :user, index: true
  has_and_belongs_to_many :races
  validates :driver_type, presence: true
end
