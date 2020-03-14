class User
  include Documentable
  include Mongoid::Locker

  field :locker_locked_at, type: Time
  field :locker_locked_until, type: Time

  locker locked_at_field: :locker_locked_at,
         locked_until_field: :locker_locked_until

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,        type: String
  field :reset_password_sent_at,      type: Time
  field :reset_password_redirect_url, type: String
  field :allow_password_change,       type: Boolean, default: false

  ## Rememberable
  field :remember_created_at, type: Time

  ## Required
  field :provider, type: String
  field :uid,      type: String, default: ''

  ## Tokens
  field :tokens, type: Hash, default: {}

  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  include DeviseTokenAuth::Concerns::User

  index({ email: 1 }, { name: 'email_index', unique: true, background: true })
  index({ reset_password_token: 1 }, { name: 'reset_password_token_index', unique: true, sparse: true, background: true })
  index({ confirmation_token: 1 }, { name: 'confirmation_token_index', unique: true, sparse: true, background: true })
  index({ uid: 1, provider: 1}, { name: 'uid_provider_index', unique: true, background: true })
  # index({ unlock_token: 1 }, { name: 'unlock_token_index', unique: true, sparse: true, background: true })

  PASSWORD_REGEX = Regexp.new('\A[A-Za-z\-_0-9\d]+\z')

  has_many :customers, dependent: :destroy
  has_many :drivers, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :races, dependent: :destroy
  # has_many :reports, through: :races
  # has_one :user_profile

  # mount_uploader :avatar, AvatarUploader

  validates :email, email: true, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :password, confirmation: true
end
