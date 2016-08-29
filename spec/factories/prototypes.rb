FactoryGirl.define do
  factory :prototype do
    name { Faker::Commerce.product_name }
    concept { Faker::Lorem.sentence }
    catch_copy { Faker::Lorem.word }
  end
end
