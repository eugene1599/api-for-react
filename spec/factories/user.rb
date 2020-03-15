FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8, 8) }
    uid { email }
  end
end
