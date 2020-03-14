class User
  include Documentable
  # include Mongoid::Attributes::Dynamic

  PASSWORD_REGEX = Regexp.new('\A[A-Za-z\-_0-9\d]+\z')

  field :email, type: String
  field :provider, type: String
  field :uid, type: String, default: ''
  field :tokens, type: Hash
  field :encrypted_password, type: String

  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  include DeviseTokenAuth::Concerns::User

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

  # FIXME, https://github.com/lynndylanhurley/devise_token_auth/issues/1335
  def saved_change_to_attribute?(attr_name, **options)
    true
  end
end
