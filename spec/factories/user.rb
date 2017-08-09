FactoryGirl.define do
  factory :user do
    email { Faker::Internet.unique.safe_email }
    username { Faker::Internet.unique.user_name }
    password { "testpw" }
  end
end
