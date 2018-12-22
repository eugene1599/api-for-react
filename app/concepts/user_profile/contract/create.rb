require 'reform'

module UserProfile::Contract
  class Create < Reform::Form
    property :first_name
    property :last_name
    property :information
    property :avatar

    validates :first_name, presence: true

    validates :avatar, file_size: { less_than: 10.kilobytes },
    file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'] }
  end
end
