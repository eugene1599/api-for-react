class User < ApplicationRecord
  PASSWORD_REGEX = Regexp.new('\A[A-Za-z\-_0-9\d]+\z')

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :customers, dependent: :destroy
  has_many :drivers, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :races, dependent: :destroy
  has_many :reports, through: :races
  has_one :user_profile

  mount_uploader :avatar, AvatarUploader

  validates :email, uniqueness: true, presence: true
  validates :password, length: { is: 8 },
                       format: { with: PASSWORD_REGEX },
                       if: -> { password.present? }
  validates :password, confirmation: true
end
