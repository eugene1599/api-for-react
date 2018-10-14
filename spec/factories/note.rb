FactoryBot.define do
  factory :note do
    title { FFaker::Book.title }
    content { FFaker::Lorem.characters(rand(10...200)) }
    user
  end
end
