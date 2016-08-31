FactoryGirl.define do
  factory :comment do
    prototype
    user
    comment { Faker::Lorem.sentence }
  end
end