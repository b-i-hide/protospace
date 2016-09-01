FactoryGirl.define do
  factory :prototype do
    name { Faker::Commerce.product_name }
    concept { Faker::Lorem.sentence }
    catch_copy { Faker::Lorem.word }
    created_at { Faker::Time.between(2.days.ago, Time.now) }
    user
  end
end
