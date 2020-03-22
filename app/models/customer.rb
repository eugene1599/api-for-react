class Customer
  include Documentable

  field :first_name, type: String
  field :last_name, type: String
  field :company, type: String

  belongs_to :user, index: true
  has_many :races, dependent: :destroy
end
