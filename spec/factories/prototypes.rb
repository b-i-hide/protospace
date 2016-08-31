FactoryGirl.define do
  factory :prototype do
    name { Faker::Commerce.product_name }
    concept { Faker::Lorem.sentence }
    catch_copy { Faker::Lorem.word }
    created_at '2016-08-26 11:39:38'
    updated_at '2016-08-26 11:39:58'
    user
  end
end
