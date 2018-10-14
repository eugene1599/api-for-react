require 'reform'

module Note::Contract
  class Create < Reform::Form
    property :title
    property :content
    property :user_id

    validates :title, presence: true
  end

  class CreateUK < Reform::Form
    property :title
    property :content
    property :user_id

    validates :title, length: { is: 100 }
  end
end
