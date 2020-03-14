class Driver
  include Documentable
  as_enum :driver_type, %i[driver mechanic forwarder]

  field :first_name, type: String
  field :last_name, type: String

  belongs_to :user
  has_and_belongs_to_many :races
  validates :driver_type, presence: true
end
