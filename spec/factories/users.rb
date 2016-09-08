FactoryGirl.define do
  factory :user do
    name 'gen'
    email { Faker::Internet.email }
    password '00000000'
    password_confirmation '00000000'
    works { Faker::Company.profession }
    profile { Faker::Lorem.paragraph }
  end
end
