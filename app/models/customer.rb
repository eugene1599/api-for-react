class Customer < ApplicationRecord
  enum type: %i[mechanic driver forwarder]
  has_many :races, dependent: :destroy
  belongs_to :user
end
