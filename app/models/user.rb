class User < ApplicationRecord
  PASSWORD_REGEX = Regexp.new('\A[A-Za-z\-_0-9\d]+\z')

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :notes, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :password, length: { is: 8 },
                       format: { with: PASSWORD_REGEX },
                       if: -> { password.present? }
  validates :password, confirmation: true
end
