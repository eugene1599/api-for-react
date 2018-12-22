class Race < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :user
  has_and_belongs_to_many :drivers
  has_many :reports, dependent: :destroy
end
