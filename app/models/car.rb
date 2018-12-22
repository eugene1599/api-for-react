class Car < ApplicationRecord
  enum car_type: %w[truck bus]
  has_many :races, dependent: :destroy
  belongs_to :user
end
