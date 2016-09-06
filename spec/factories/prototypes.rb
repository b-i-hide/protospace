FactoryGirl.define do
  factory :prototype do
    name 'test'
    concept { Faker::Lorem.sentence }
    catch_copy { Faker::Lorem.word }
    created_at { Faker::Time.between(2.days.ago, Time.now) }
    user

    after(:create) do |prototype|
      create(:image, :main_image, prototype: prototype)
    end
  end
end
